#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/4GV1_40363/output.txt

# run
python prepare_receptor.py 4GV1
python prepare_ligand.py 40363
sh prepare_config.sh 4GV1 40363

vina --out hot/4GV1_40363/model.pdbqt --log hot/4GV1_40363/report.txt --receptor data/4GV1.pdbqt --ligand data/40363.pdbqt --config hot/4GV1_40363/config.txt

python extract_score.py hot/4GV1_40363

rm task/matrix_19x13_4GV1_40363_docking.sbatch
