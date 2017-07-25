#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/5A8X_26602/output.txt

# run
python prepare_receptor.py 5A8X
python prepare_ligand.py 26602
sh prepare_config.sh 5A8X 26602

vina --out hot/5A8X_26602/model.pdbqt --log hot/5A8X_26602/report.txt --receptor data/5A8X.pdbqt --ligand data/26602.pdbqt --config hot/5A8X_26602/config.txt

python extract_score.py hot/5A8X_26602

rm task/5A8X_26602_docking.sbatch
