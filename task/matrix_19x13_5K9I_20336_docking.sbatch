#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/5K9I_20336/output.txt

# run
python prepare_receptor.py 5K9I
python prepare_ligand.py 20336
sh prepare_config.sh 5K9I 20336

vina --out hot/5K9I_20336/model.pdbqt --log hot/5K9I_20336/report.txt --receptor data/5K9I.pdbqt --ligand data/20336.pdbqt --config hot/5K9I_20336/config.txt

python extract_score.py hot/5K9I_20336

rm task/5K9I_20336_docking.sbatch
