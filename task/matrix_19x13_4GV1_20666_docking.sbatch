#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/4GV1_20666/output.txt

# run
python prepare_receptor.py 4GV1
python prepare_ligand.py 20666
sh prepare_config.sh 4GV1 20666

vina --out hot/4GV1_20666/model.pdbqt --log hot/4GV1_20666/report.txt --receptor data/4GV1.pdbqt --ligand data/20666.pdbqt --config hot/4GV1_20666/config.txt

python extract_score.py hot/4GV1_20666

rm task/4GV1_20666_docking.sbatch
