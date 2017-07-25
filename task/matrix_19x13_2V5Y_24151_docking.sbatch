#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/2V5Y_24151/output.txt

# run
python prepare_receptor.py 2V5Y
python prepare_ligand.py 24151
sh prepare_config.sh 2V5Y 24151

vina --out hot/2V5Y_24151/model.pdbqt --log hot/2V5Y_24151/report.txt --receptor data/2V5Y.pdbqt --ligand data/24151.pdbqt --config hot/2V5Y_24151/config.txt

python extract_score.py hot/2V5Y_24151

rm task/2V5Y_24151_docking.sbatch
