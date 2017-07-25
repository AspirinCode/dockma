#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/4ZNX_26602/output.txt

# run
python prepare_receptor.py 4ZNX
python prepare_ligand.py 26602
sh prepare_config.sh 4ZNX 26602

vina --out hot/4ZNX_26602/model.pdbqt --log hot/4ZNX_26602/report.txt --receptor data/4ZNX.pdbqt --ligand data/26602.pdbqt --config hot/4ZNX_26602/config.txt

python extract_score.py hot/4ZNX_26602

rm task/4ZNX_26602_docking.sbatch
