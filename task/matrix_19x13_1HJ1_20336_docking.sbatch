#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/1HJ1_20336/output.txt

# run
python prepare_receptor.py 1HJ1
python prepare_ligand.py 20336
sh prepare_config.sh 1HJ1 20336

vina --out hot/1HJ1_20336/model.pdbqt --log hot/1HJ1_20336/report.txt --receptor data/1HJ1.pdbqt --ligand data/20336.pdbqt --config hot/1HJ1_20336/config.txt

python extract_score.py hot/1HJ1_20336

rm task/matrix_19x13_1HJ1_20336_docking.sbatch
