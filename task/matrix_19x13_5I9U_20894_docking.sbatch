#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/5I9U_20894/output.txt

# run
python prepare_receptor.py 5I9U
python prepare_ligand.py 20894
sh prepare_config.sh 5I9U 20894

vina --out hot/5I9U_20894/model.pdbqt --log hot/5I9U_20894/report.txt --receptor data/5I9U.pdbqt --ligand data/20894.pdbqt --config hot/5I9U_20894/config.txt

python extract_score.py hot/5I9U_20894

rm task/5I9U_20894_docking.sbatch
