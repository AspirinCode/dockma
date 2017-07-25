#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/5K9I_31862/output.txt

# run
python prepare_receptor.py 5K9I
python prepare_ligand.py 31862
sh prepare_config.sh 5K9I 31862

vina --out hot/5K9I_31862/model.pdbqt --log hot/5K9I_31862/report.txt --receptor data/5K9I.pdbqt --ligand data/31862.pdbqt --config hot/5K9I_31862/config.txt

python extract_score.py hot/5K9I_31862

rm task/5K9I_31862_docking.sbatch
