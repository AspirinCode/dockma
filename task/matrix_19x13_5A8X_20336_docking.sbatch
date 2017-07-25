#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/5A8X_20336/output.txt

# run
python prepare_receptor.py 5A8X
python prepare_ligand.py 20336
sh prepare_config.sh 5A8X 20336

vina --out hot/5A8X_20336/model.pdbqt --log hot/5A8X_20336/report.txt --receptor data/5A8X.pdbqt --ligand data/20336.pdbqt --config hot/5A8X_20336/config.txt

python extract_score.py hot/5A8X_20336

rm task/5A8X_20336_docking.sbatch
