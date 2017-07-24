from signal import SIGTERM
import os
from parameter import root,pid
from screening_stop_after import clean

try:
	id = int(open(pid).read().strip('\n'))
	os.kill(id, SIGTERM)
except OSError as e:
	pass

clean(root, pid)
