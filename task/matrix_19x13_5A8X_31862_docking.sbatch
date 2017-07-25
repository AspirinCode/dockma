#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/5A8X_31862/output.txt

# run
python prepare_receptor.py 5A8X
python prepare_ligand.py 31862
sh prepare_config.sh 5A8X 31862

vina --out hot/5A8X_31862/model.pdbqt --log hot/5A8X_31862/report.txt --receptor data/5A8X.pdbqt --ligand data/31862.pdbqt --config hot/5A8X_31862/config.txt

python extract_score.py hot/5A8X_31862

rm task/5A8X_31862_docking.sbatch
