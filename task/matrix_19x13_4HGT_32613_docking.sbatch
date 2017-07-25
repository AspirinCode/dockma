#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/4HGT_32613/output.txt

# run
python prepare_receptor.py 4HGT
python prepare_ligand.py 32613
sh prepare_config.sh 4HGT 32613

vina --out hot/4HGT_32613/model.pdbqt --log hot/4HGT_32613/report.txt --receptor data/4HGT.pdbqt --ligand data/32613.pdbqt --config hot/4HGT_32613/config.txt

python extract_score.py hot/4HGT_32613

rm task/matrix_19x13_4HGT_32613_docking.sbatch
