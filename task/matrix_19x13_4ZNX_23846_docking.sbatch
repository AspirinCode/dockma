#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/4ZNX_23846/output.txt

# run
python prepare_receptor.py 4ZNX
python prepare_ligand.py 23846
sh prepare_config.sh 4ZNX 23846

vina --out hot/4ZNX_23846/model.pdbqt --log hot/4ZNX_23846/report.txt --receptor data/4ZNX.pdbqt --ligand data/23846.pdbqt --config hot/4ZNX_23846/config.txt

python extract_score.py hot/4ZNX_23846

rm task/4ZNX_23846_docking.sbatch
