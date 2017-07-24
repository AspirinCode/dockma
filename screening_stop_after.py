import os

def clean(root, pid):
	os.system('rm -f ' + pid)
