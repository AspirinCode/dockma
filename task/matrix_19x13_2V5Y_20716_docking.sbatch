#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/2V5Y_20716/output.txt

# run
python prepare_receptor.py 2V5Y
python prepare_ligand.py 20716
sh prepare_config.sh 2V5Y 20716

vina --out hot/2V5Y_20716/model.pdbqt --log hot/2V5Y_20716/report.txt --receptor data/2V5Y.pdbqt --ligand data/20716.pdbqt --config hot/2V5Y_20716/config.txt

python extract_score.py hot/2V5Y_20716

rm task/2V5Y_20716_docking.sbatch
