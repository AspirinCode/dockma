#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/1HJ1_32613/output.txt

# run
python prepare_receptor.py 1HJ1
python prepare_ligand.py 32613
sh prepare_config.sh 1HJ1 32613

vina --out hot/1HJ1_32613/model.pdbqt --log hot/1HJ1_32613/report.txt --receptor data/1HJ1.pdbqt --ligand data/32613.pdbqt --config hot/1HJ1_32613/config.txt

python extract_score.py hot/1HJ1_32613

rm task/matrix_19x13_1HJ1_32613_docking.sbatch
