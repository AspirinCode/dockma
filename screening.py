from daemon import Daemon
import time
import os

class Screening(Daemon):
	def __init__(self, 
			pidfile = 'process.pid', 
			root = '.',
			pair):
		Daemon.__init__(self, pidfile, root)
		self.pair = pair

	def process(self, pid, cid):
			pass	

	def run(self):
		while count:
			for line in open(self.pair):
				pid, cid = line.strip('\n').split('\t')
				self.process(pid, cid)
				
	
		self.stop()
