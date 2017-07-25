#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/1NPO_20716/output.txt

# run
python prepare_receptor.py 1NPO
python prepare_ligand.py 20716
sh prepare_config.sh 1NPO 20716

vina --out hot/1NPO_20716/model.pdbqt --log hot/1NPO_20716/report.txt --receptor data/1NPO.pdbqt --ligand data/20716.pdbqt --config hot/1NPO_20716/config.txt

python extract_score.py hot/1NPO_20716

rm task/1NPO_20716_docking.sbatch
