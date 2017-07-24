import sys
from parameter import maxscore

def readscore(pid, cid, maxscore):
	try:
		return float(open('hot/{}_{}/score.txt'.format(pid, cid)).read().strip('\n'))
	except:
		return maxscore + 1


rel = {}
rows = []
columns = []
minscore = float('inf')
for line in sys.stdin:
	pid, cid = line.strip('\n').split('\t')

	if not cid in  rows:
		rows.append(cid)

	if not pid in  columns:
		columns.append(pid)

	score = readscore(pid, cid, float(maxscore)) 
	minscore = min(score, minscore)

	rel['{}_{}'.format(cid, pid)] = score

rows = sorted(rows)
columns = sorted(columns)

print(0.0, abs(minscore) + maxscore, sep = '\t')
print('\t' + '\t'.join(columns))

for cid in rows:
	row = ['{:.2f}'.format(abs(minscore) + rel['{}_{}'.format(cid,pid)]) for pid in columns]
	print('{}\t{}'.format(cid, '\t'.join(row)))

