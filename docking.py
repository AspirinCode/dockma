import os
import sys

pid, cid = sys.argv[1:3]

os.system('vina --out hot/{0}_{1}/model.pdbqt --log hot/{0}_{1}/report.txt --receptor data/{0}.pdbqt --ligand data/{1}.pdbqt --config hot/{0}_{1}/config.txt'.format(pid,cid))
