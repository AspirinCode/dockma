#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/4ZNX_47339/output.txt

# run
python prepare_receptor.py 4ZNX
python prepare_ligand.py 47339
sh prepare_config.sh 4ZNX 47339

vina --out hot/4ZNX_47339/model.pdbqt --log hot/4ZNX_47339/report.txt --receptor data/4ZNX.pdbqt --ligand data/47339.pdbqt --config hot/4ZNX_47339/config.txt

python extract_score.py hot/4ZNX_47339

rm task/4ZNX_47339_docking.sbatch
