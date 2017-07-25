#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/5HYK_23846/output.txt

# run
python prepare_receptor.py 5HYK
python prepare_ligand.py 23846
sh prepare_config.sh 5HYK 23846

vina --out hot/5HYK_23846/model.pdbqt --log hot/5HYK_23846/report.txt --receptor data/5HYK.pdbqt --ligand data/23846.pdbqt --config hot/5HYK_23846/config.txt

python extract_score.py hot/5HYK_23846

rm task/5HYK_23846_docking.sbatch
