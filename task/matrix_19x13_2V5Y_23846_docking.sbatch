#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/2V5Y_23846/output.txt

# run
python prepare_receptor.py 2V5Y
python prepare_ligand.py 23846
sh prepare_config.sh 2V5Y 23846

vina --out hot/2V5Y_23846/model.pdbqt --log hot/2V5Y_23846/report.txt --receptor data/2V5Y.pdbqt --ligand data/23846.pdbqt --config hot/2V5Y_23846/config.txt

python extract_score.py hot/2V5Y_23846

rm task/2V5Y_23846_docking.sbatch
