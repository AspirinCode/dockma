#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/1HJ1_26602/output.txt

# run
python prepare_receptor.py 1HJ1
python prepare_ligand.py 26602
sh prepare_config.sh 1HJ1 26602

vina --out hot/1HJ1_26602/model.pdbqt --log hot/1HJ1_26602/report.txt --receptor data/1HJ1.pdbqt --ligand data/26602.pdbqt --config hot/1HJ1_26602/config.txt

python extract_score.py hot/1HJ1_26602

rm task/matrix_19x13_1HJ1_26602_docking.sbatch
