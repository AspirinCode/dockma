#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/1HJ1_23846/output.txt

# run
python prepare_receptor.py 1HJ1
python prepare_ligand.py 23846
sh prepare_config.sh 1HJ1 23846

vina --out hot/1HJ1_23846/model.pdbqt --log hot/1HJ1_23846/report.txt --receptor data/1HJ1.pdbqt --ligand data/23846.pdbqt --config hot/1HJ1_23846/config.txt

python extract_score.py hot/1HJ1_23846

rm task/matrix_19x13_1HJ1_23846_docking.sbatch
