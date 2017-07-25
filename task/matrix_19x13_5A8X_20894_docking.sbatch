#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/5A8X_20894/output.txt

# run
python prepare_receptor.py 5A8X
python prepare_ligand.py 20894
sh prepare_config.sh 5A8X 20894

vina --out hot/5A8X_20894/model.pdbqt --log hot/5A8X_20894/report.txt --receptor data/5A8X.pdbqt --ligand data/20894.pdbqt --config hot/5A8X_20894/config.txt

python extract_score.py hot/5A8X_20894

rm task/5A8X_20894_docking.sbatch
