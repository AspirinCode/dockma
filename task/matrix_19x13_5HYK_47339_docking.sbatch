#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/5HYK_47339/output.txt

# run
python prepare_receptor.py 5HYK
python prepare_ligand.py 47339
sh prepare_config.sh 5HYK 47339

vina --out hot/5HYK_47339/model.pdbqt --log hot/5HYK_47339/report.txt --receptor data/5HYK.pdbqt --ligand data/47339.pdbqt --config hot/5HYK_47339/config.txt

python extract_score.py hot/5HYK_47339

rm task/5HYK_47339_docking.sbatch
