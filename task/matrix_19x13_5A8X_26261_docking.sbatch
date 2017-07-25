#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/5A8X_26261/output.txt

# run
python prepare_receptor.py 5A8X
python prepare_ligand.py 26261
sh prepare_config.sh 5A8X 26261

vina --out hot/5A8X_26261/model.pdbqt --log hot/5A8X_26261/report.txt --receptor data/5A8X.pdbqt --ligand data/26261.pdbqt --config hot/5A8X_26261/config.txt

python extract_score.py hot/5A8X_26261

rm task/5A8X_26261_docking.sbatch
