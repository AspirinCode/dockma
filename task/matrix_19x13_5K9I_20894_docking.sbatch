#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/5K9I_20894/output.txt

# run
python prepare_receptor.py 5K9I
python prepare_ligand.py 20894
sh prepare_config.sh 5K9I 20894

vina --out hot/5K9I_20894/model.pdbqt --log hot/5K9I_20894/report.txt --receptor data/5K9I.pdbqt --ligand data/20894.pdbqt --config hot/5K9I_20894/config.txt

python extract_score.py hot/5K9I_20894

rm task/5K9I_20894_docking.sbatch
