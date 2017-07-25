#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/1NPO_32601/output.txt

# run
python prepare_receptor.py 1NPO
python prepare_ligand.py 32601
sh prepare_config.sh 1NPO 32601

vina --out hot/1NPO_32601/model.pdbqt --log hot/1NPO_32601/report.txt --receptor data/1NPO.pdbqt --ligand data/32601.pdbqt --config hot/1NPO_32601/config.txt

python extract_score.py hot/1NPO_32601

rm task/1NPO_32601_docking.sbatch
