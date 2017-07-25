#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/5I9U_32601/output.txt

# run
python prepare_receptor.py 5I9U
python prepare_ligand.py 32601
sh prepare_config.sh 5I9U 32601

vina --out hot/5I9U_32601/model.pdbqt --log hot/5I9U_32601/report.txt --receptor data/5I9U.pdbqt --ligand data/32601.pdbqt --config hot/5I9U_32601/config.txt

python extract_score.py hot/5I9U_32601

rm task/5I9U_32601_docking.sbatch
