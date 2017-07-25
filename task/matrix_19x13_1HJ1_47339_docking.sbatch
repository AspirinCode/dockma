#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/1HJ1_47339/output.txt

# run
python prepare_receptor.py 1HJ1
python prepare_ligand.py 47339
sh prepare_config.sh 1HJ1 47339

vina --out hot/1HJ1_47339/model.pdbqt --log hot/1HJ1_47339/report.txt --receptor data/1HJ1.pdbqt --ligand data/47339.pdbqt --config hot/1HJ1_47339/config.txt

python extract_score.py hot/1HJ1_47339

rm task/matrix_19x13_1HJ1_47339_docking.sbatch
