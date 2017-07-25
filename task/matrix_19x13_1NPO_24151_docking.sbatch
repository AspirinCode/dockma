#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/1NPO_24151/output.txt

# run
python prepare_receptor.py 1NPO
python prepare_ligand.py 24151
sh prepare_config.sh 1NPO 24151

vina --out hot/1NPO_24151/model.pdbqt --log hot/1NPO_24151/report.txt --receptor data/1NPO.pdbqt --ligand data/24151.pdbqt --config hot/1NPO_24151/config.txt

python extract_score.py hot/1NPO_24151

rm task/matrix_19x13_1NPO_24151_docking.sbatch
