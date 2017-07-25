#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/1HJ1_32601/output.txt

# run
python prepare_receptor.py 1HJ1
python prepare_ligand.py 32601
sh prepare_config.sh 1HJ1 32601

vina --out hot/1HJ1_32601/model.pdbqt --log hot/1HJ1_32601/report.txt --receptor data/1HJ1.pdbqt --ligand data/32601.pdbqt --config hot/1HJ1_32601/config.txt

python extract_score.py hot/1HJ1_32601

rm task/matrix_19x13_1HJ1_32601_docking.sbatch
