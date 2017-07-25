#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/2V5Y_47339/output.txt

# run
python prepare_receptor.py 2V5Y
python prepare_ligand.py 47339
sh prepare_config.sh 2V5Y 47339

vina --out hot/2V5Y_47339/model.pdbqt --log hot/2V5Y_47339/report.txt --receptor data/2V5Y.pdbqt --ligand data/47339.pdbqt --config hot/2V5Y_47339/config.txt

python extract_score.py hot/2V5Y_47339

rm task/matrix_19x13_2V5Y_47339_docking.sbatch
