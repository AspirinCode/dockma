#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/1NPO_26261/output.txt

# run
python prepare_receptor.py 1NPO
python prepare_ligand.py 26261
sh prepare_config.sh 1NPO 26261

vina --out hot/1NPO_26261/model.pdbqt --log hot/1NPO_26261/report.txt --receptor data/1NPO.pdbqt --ligand data/26261.pdbqt --config hot/1NPO_26261/config.txt

python extract_score.py hot/1NPO_26261

rm task/1NPO_26261_docking.sbatch
