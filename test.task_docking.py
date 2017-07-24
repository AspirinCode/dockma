import os

template = open('template/task_docking.sbatch').read()

for line in open('hot/pair.txt'):
	pid, cid = line.strip('\n').split('\t')

	dir = 'hot/{}_{}'.format(pid, cid)
	if not os.path.isdir(dir):
		task = template.replace('PID', pid).replace('CID',cid)
		path = 'task/{}_{}_docking.sbatch'.format(pid, cid)
		open(path,'w').write(task)

		os.system('mkdir {}'.format(dir))
		os.system('sbatch ' + path )

