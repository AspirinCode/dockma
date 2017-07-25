#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/5A8X_40363/output.txt

# run
python prepare_receptor.py 5A8X
python prepare_ligand.py 40363
sh prepare_config.sh 5A8X 40363

vina --out hot/5A8X_40363/model.pdbqt --log hot/5A8X_40363/report.txt --receptor data/5A8X.pdbqt --ligand data/40363.pdbqt --config hot/5A8X_40363/config.txt

python extract_score.py hot/5A8X_40363

rm task/5A8X_40363_docking.sbatch
