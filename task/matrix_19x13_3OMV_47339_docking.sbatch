#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/3OMV_47339/output.txt

# run
python prepare_receptor.py 3OMV
python prepare_ligand.py 47339
sh prepare_config.sh 3OMV 47339

vina --out hot/3OMV_47339/model.pdbqt --log hot/3OMV_47339/report.txt --receptor data/3OMV.pdbqt --ligand data/47339.pdbqt --config hot/3OMV_47339/config.txt

python extract_score.py hot/3OMV_47339

rm task/matrix_19x13_3OMV_47339_docking.sbatch
