import sys

dir = sys.argv[1]

data = open(dir + '/report.txt').read().strip('\n').split('\n')
data = data[-2].split()

open(dir + '/score.txt','w').write(data[1])
