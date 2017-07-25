import os

def clean(pid):
	os.system('rm -f ' + pid)
	os.system('rm -f task/*')
