#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/5A8X_24151/output.txt

# run
python prepare_receptor.py 5A8X
python prepare_ligand.py 24151
sh prepare_config.sh 5A8X 24151

vina --out hot/5A8X_24151/model.pdbqt --log hot/5A8X_24151/report.txt --receptor data/5A8X.pdbqt --ligand data/24151.pdbqt --config hot/5A8X_24151/config.txt

python extract_score.py hot/5A8X_24151

rm task/5A8X_24151_docking.sbatch
