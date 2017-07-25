#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/2V5Y_20894/output.txt

# run
python prepare_receptor.py 2V5Y
python prepare_ligand.py 20894
sh prepare_config.sh 2V5Y 20894

vina --out hot/2V5Y_20894/model.pdbqt --log hot/2V5Y_20894/report.txt --receptor data/2V5Y.pdbqt --ligand data/20894.pdbqt --config hot/2V5Y_20894/config.txt

python extract_score.py hot/2V5Y_20894

rm task/2V5Y_20894_docking.sbatch
