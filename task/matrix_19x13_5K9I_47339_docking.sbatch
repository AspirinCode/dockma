#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/5K9I_47339/output.txt

# run
python prepare_receptor.py 5K9I
python prepare_ligand.py 47339
sh prepare_config.sh 5K9I 47339

vina --out hot/5K9I_47339/model.pdbqt --log hot/5K9I_47339/report.txt --receptor data/5K9I.pdbqt --ligand data/47339.pdbqt --config hot/5K9I_47339/config.txt

python extract_score.py hot/5K9I_47339

rm task/5K9I_47339_docking.sbatch
