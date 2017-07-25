#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/5HYK_20716/output.txt

# run
python prepare_receptor.py 5HYK
python prepare_ligand.py 20716
sh prepare_config.sh 5HYK 20716

vina --out hot/5HYK_20716/model.pdbqt --log hot/5HYK_20716/report.txt --receptor data/5HYK.pdbqt --ligand data/20716.pdbqt --config hot/5HYK_20716/config.txt

python extract_score.py hot/5HYK_20716

rm task/5HYK_20716_docking.sbatch
