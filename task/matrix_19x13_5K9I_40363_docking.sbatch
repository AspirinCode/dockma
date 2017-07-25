#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/5K9I_40363/output.txt

# run
python prepare_receptor.py 5K9I
python prepare_ligand.py 40363
sh prepare_config.sh 5K9I 40363

vina --out hot/5K9I_40363/model.pdbqt --log hot/5K9I_40363/report.txt --receptor data/5K9I.pdbqt --ligand data/40363.pdbqt --config hot/5K9I_40363/config.txt

python extract_score.py hot/5K9I_40363

rm task/5K9I_40363_docking.sbatch
