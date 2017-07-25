#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/4HGT_47339/output.txt

# run
python prepare_receptor.py 4HGT
python prepare_ligand.py 47339
sh prepare_config.sh 4HGT 47339

vina --out hot/4HGT_47339/model.pdbqt --log hot/4HGT_47339/report.txt --receptor data/4HGT.pdbqt --ligand data/47339.pdbqt --config hot/4HGT_47339/config.txt

python extract_score.py hot/4HGT_47339

rm task/matrix_19x13_4HGT_47339_docking.sbatch
