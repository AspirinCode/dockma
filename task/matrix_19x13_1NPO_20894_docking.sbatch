#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/1NPO_20894/output.txt

# run
python prepare_receptor.py 1NPO
python prepare_ligand.py 20894
sh prepare_config.sh 1NPO 20894

vina --out hot/1NPO_20894/model.pdbqt --log hot/1NPO_20894/report.txt --receptor data/1NPO.pdbqt --ligand data/20894.pdbqt --config hot/1NPO_20894/config.txt

python extract_score.py hot/1NPO_20894

rm task/1NPO_20894_docking.sbatch
