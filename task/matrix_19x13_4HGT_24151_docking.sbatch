#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/4HGT_24151/output.txt

# run
python prepare_receptor.py 4HGT
python prepare_ligand.py 24151
sh prepare_config.sh 4HGT 24151

vina --out hot/4HGT_24151/model.pdbqt --log hot/4HGT_24151/report.txt --receptor data/4HGT.pdbqt --ligand data/24151.pdbqt --config hot/4HGT_24151/config.txt

python extract_score.py hot/4HGT_24151

rm task/4HGT_24151_docking.sbatch
