from dockingbox import createbox
import sys
from parameter import *

pid,cid = sys.argv[1:3]

box, center = createbox(1)

config = open('template/config.txt').read()

config = config.replace('__EXHAUSTIVENESS__', str(exhaustiveness))

config = config.replace('__CENTER_X__', str(center[0]))
config = config.replace('__CENTER_Y__', str(center[1]))
config = config.replace('__CENTER_Z__', str(center[2]))

config = config.replace('__SIZE_X__', str(box[0]))
config = config.replace('__SIZE_Y__', str(box[1]))
config = config.replace('__SIZE_Z__', str(box[2]))

open('hot/{}_{}/config.txt'.format(pid, cid),'w').write(config)
