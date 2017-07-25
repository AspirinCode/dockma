#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/2V5Y_32601/output.txt

# run
python prepare_receptor.py 2V5Y
python prepare_ligand.py 32601
sh prepare_config.sh 2V5Y 32601

vina --out hot/2V5Y_32601/model.pdbqt --log hot/2V5Y_32601/report.txt --receptor data/2V5Y.pdbqt --ligand data/32601.pdbqt --config hot/2V5Y_32601/config.txt

python extract_score.py hot/2V5Y_32601

rm task/2V5Y_32601_docking.sbatch
