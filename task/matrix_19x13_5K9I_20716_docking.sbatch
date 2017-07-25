#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/5K9I_20716/output.txt

# run
python prepare_receptor.py 5K9I
python prepare_ligand.py 20716
sh prepare_config.sh 5K9I 20716

vina --out hot/5K9I_20716/model.pdbqt --log hot/5K9I_20716/report.txt --receptor data/5K9I.pdbqt --ligand data/20716.pdbqt --config hot/5K9I_20716/config.txt

python extract_score.py hot/5K9I_20716

rm task/5K9I_20716_docking.sbatch
