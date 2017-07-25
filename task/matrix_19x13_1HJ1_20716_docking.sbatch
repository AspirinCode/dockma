#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/1HJ1_20716/output.txt

# run
python prepare_receptor.py 1HJ1
python prepare_ligand.py 20716
sh prepare_config.sh 1HJ1 20716

vina --out hot/1HJ1_20716/model.pdbqt --log hot/1HJ1_20716/report.txt --receptor data/1HJ1.pdbqt --ligand data/20716.pdbqt --config hot/1HJ1_20716/config.txt

python extract_score.py hot/1HJ1_20716

rm task/matrix_19x13_1HJ1_20716_docking.sbatch
