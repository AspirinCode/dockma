#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/2V5Y_31862/output.txt

# run
python prepare_receptor.py 2V5Y
python prepare_ligand.py 31862
sh prepare_config.sh 2V5Y 31862

vina --out hot/2V5Y_31862/model.pdbqt --log hot/2V5Y_31862/report.txt --receptor data/2V5Y.pdbqt --ligand data/31862.pdbqt --config hot/2V5Y_31862/config.txt

python extract_score.py hot/2V5Y_31862

rm task/matrix_19x13_2V5Y_31862_docking.sbatch
