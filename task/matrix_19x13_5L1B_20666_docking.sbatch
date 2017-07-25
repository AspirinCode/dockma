#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/5L1B_20666/output.txt

# run
python prepare_receptor.py 5L1B
python prepare_ligand.py 20666
sh prepare_config.sh 5L1B 20666

vina --out hot/5L1B_20666/model.pdbqt --log hot/5L1B_20666/report.txt --receptor data/5L1B.pdbqt --ligand data/20666.pdbqt --config hot/5L1B_20666/config.txt

python extract_score.py hot/5L1B_20666

rm task/5L1B_20666_docking.sbatch
