#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/5I9U_24151/output.txt

# run
python prepare_receptor.py 5I9U
python prepare_ligand.py 24151
sh prepare_config.sh 5I9U 24151

vina --out hot/5I9U_24151/model.pdbqt --log hot/5I9U_24151/report.txt --receptor data/5I9U.pdbqt --ligand data/24151.pdbqt --config hot/5I9U_24151/config.txt

python extract_score.py hot/5I9U_24151

rm task/5I9U_24151_docking.sbatch
