#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/4OEW_20716/output.txt

# run
python prepare_receptor.py 4OEW
python prepare_ligand.py 20716
sh prepare_config.sh 4OEW 20716

vina --out hot/4OEW_20716/model.pdbqt --log hot/4OEW_20716/report.txt --receptor data/4OEW.pdbqt --ligand data/20716.pdbqt --config hot/4OEW_20716/config.txt

python extract_score.py hot/4OEW_20716

rm task/4OEW_20716_docking.sbatch
