#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/5A8X_32601/output.txt

# run
python prepare_receptor.py 5A8X
python prepare_ligand.py 32601
sh prepare_config.sh 5A8X 32601

vina --out hot/5A8X_32601/model.pdbqt --log hot/5A8X_32601/report.txt --receptor data/5A8X.pdbqt --ligand data/32601.pdbqt --config hot/5A8X_32601/config.txt

python extract_score.py hot/5A8X_32601

rm task/5A8X_32601_docking.sbatch
