#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/4JP4_20336/output.txt

# run
python prepare_receptor.py 4JP4
python prepare_ligand.py 20336
sh prepare_config.sh 4JP4 20336

vina --out hot/4JP4_20336/model.pdbqt --log hot/4JP4_20336/report.txt --receptor data/4JP4.pdbqt --ligand data/20336.pdbqt --config hot/4JP4_20336/config.txt

python extract_score.py hot/4JP4_20336

rm task/matrix_19x13_4JP4_20336_docking.sbatch
