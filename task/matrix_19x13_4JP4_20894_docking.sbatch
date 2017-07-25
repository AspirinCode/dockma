#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/4JP4_20894/output.txt

# run
python prepare_receptor.py 4JP4
python prepare_ligand.py 20894
sh prepare_config.sh 4JP4 20894

vina --out hot/4JP4_20894/model.pdbqt --log hot/4JP4_20894/report.txt --receptor data/4JP4.pdbqt --ligand data/20894.pdbqt --config hot/4JP4_20894/config.txt

python extract_score.py hot/4JP4_20894

rm task/4JP4_20894_docking.sbatch
