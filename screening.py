from daemon import Daemon
import time
import os
import re

class Screening(Daemon):
	def __init__(self, 
			user,
			project,
			pair,
			payload = 50,
			runnies = 10,
			hold_time = 5):
		Daemon.__init__(
				self, 
				pidfile = 'log/process.pid', 
				root = '.',
				stdout = 'log/stdout.txt',
				stderr = 'log/stderr.txt')

		self.pair = pair
		self.user = user
		self.project = project
		self.payload = payload
		self.runnies = runnies
		self.hold_time = hold_time

		self.index = 1
		self.template = open('template/task_docking.sbatch').read()

	def jCount(self, state = 'R'):
		statsfile = 'log/stats.txt'
		os.system("squeue -t {} -u {} --Format=name | grep -e '{}_' | wc > {}".format(state, self.user, self.project, statsfile))
		tpl = open(statsfile).read().strip()
		tpl = re.split('\s+',tpl)

		return int(tpl[0])

	def hold(self):
		jc = self.jCount()
		while jc > self.runnies:
			print('holding ... {} runnies'.format(jc))
			time.sleep(self.hold_time)
			jc = self.jCount()

	def process(self, pid, cid):
		if self.index % self.payload == 0:
			self.hold()

		dir = 'hot/{}_{}'.format(pid, cid)
		if not os.path.isdir(dir):
			task = self.template.replace('PID', pid).replace('CID',cid)
			path = 'task/{}_{}_{}_docking.sbatch'.format(self.project,pid, cid)
			open(path,'w').write(task)

			os.system('mkdir {}'.format(dir))
			os.system('sbatch ' + path )

			self.index += 1

	def run(self):
		while True:
			for line in open(self.pair):
				pid, cid = line.strip('\n').split('\t')
				self.process(pid, cid)

			if not self.jCount('PD,R'):
				break
				
	
		self.stop()
