#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/4GV1_23846/output.txt

# run
python prepare_receptor.py 4GV1
python prepare_ligand.py 23846
sh prepare_config.sh 4GV1 23846

vina --out hot/4GV1_23846/model.pdbqt --log hot/4GV1_23846/report.txt --receptor data/4GV1.pdbqt --ligand data/23846.pdbqt --config hot/4GV1_23846/config.txt

python extract_score.py hot/4GV1_23846

rm task/matrix_19x13_4GV1_23846_docking.sbatch
