#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/5HYK_20666/output.txt

# run
python prepare_receptor.py 5HYK
python prepare_ligand.py 20666
sh prepare_config.sh 5HYK 20666

vina --out hot/5HYK_20666/model.pdbqt --log hot/5HYK_20666/report.txt --receptor data/5HYK.pdbqt --ligand data/20666.pdbqt --config hot/5HYK_20666/config.txt

python extract_score.py hot/5HYK_20666

rm task/5HYK_20666_docking.sbatch
