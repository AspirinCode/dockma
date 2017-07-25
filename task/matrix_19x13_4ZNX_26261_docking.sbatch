#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/4ZNX_26261/output.txt

# run
python prepare_receptor.py 4ZNX
python prepare_ligand.py 26261
sh prepare_config.sh 4ZNX 26261

vina --out hot/4ZNX_26261/model.pdbqt --log hot/4ZNX_26261/report.txt --receptor data/4ZNX.pdbqt --ligand data/26261.pdbqt --config hot/4ZNX_26261/config.txt

python extract_score.py hot/4ZNX_26261

rm task/4ZNX_26261_docking.sbatch
