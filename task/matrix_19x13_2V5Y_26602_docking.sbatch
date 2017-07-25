#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/2V5Y_26602/output.txt

# run
python prepare_receptor.py 2V5Y
python prepare_ligand.py 26602
sh prepare_config.sh 2V5Y 26602

vina --out hot/2V5Y_26602/model.pdbqt --log hot/2V5Y_26602/report.txt --receptor data/2V5Y.pdbqt --ligand data/26602.pdbqt --config hot/2V5Y_26602/config.txt

python extract_score.py hot/2V5Y_26602

rm task/2V5Y_26602_docking.sbatch
