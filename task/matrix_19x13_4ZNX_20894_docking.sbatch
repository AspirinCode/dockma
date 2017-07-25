#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/4ZNX_20894/output.txt

# run
python prepare_receptor.py 4ZNX
python prepare_ligand.py 20894
sh prepare_config.sh 4ZNX 20894

vina --out hot/4ZNX_20894/model.pdbqt --log hot/4ZNX_20894/report.txt --receptor data/4ZNX.pdbqt --ligand data/20894.pdbqt --config hot/4ZNX_20894/config.txt

python extract_score.py hot/4ZNX_20894

rm task/4ZNX_20894_docking.sbatch
