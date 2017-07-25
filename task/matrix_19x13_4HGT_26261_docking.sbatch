#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/4HGT_26261/output.txt

# run
python prepare_receptor.py 4HGT
python prepare_ligand.py 26261
sh prepare_config.sh 4HGT 26261

vina --out hot/4HGT_26261/model.pdbqt --log hot/4HGT_26261/report.txt --receptor data/4HGT.pdbqt --ligand data/26261.pdbqt --config hot/4HGT_26261/config.txt

python extract_score.py hot/4HGT_26261

rm task/matrix_19x13_4HGT_26261_docking.sbatch
