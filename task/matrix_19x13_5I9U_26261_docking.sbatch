#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/5I9U_26261/output.txt

# run
python prepare_receptor.py 5I9U
python prepare_ligand.py 26261
sh prepare_config.sh 5I9U 26261

vina --out hot/5I9U_26261/model.pdbqt --log hot/5I9U_26261/report.txt --receptor data/5I9U.pdbqt --ligand data/26261.pdbqt --config hot/5I9U_26261/config.txt

python extract_score.py hot/5I9U_26261

rm task/5I9U_26261_docking.sbatch
