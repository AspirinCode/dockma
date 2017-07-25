#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/3OMV_23846/output.txt

# run
python prepare_receptor.py 3OMV
python prepare_ligand.py 23846
sh prepare_config.sh 3OMV 23846

vina --out hot/3OMV_23846/model.pdbqt --log hot/3OMV_23846/report.txt --receptor data/3OMV.pdbqt --ligand data/23846.pdbqt --config hot/3OMV_23846/config.txt

python extract_score.py hot/3OMV_23846

rm task/matrix_19x13_3OMV_23846_docking.sbatch
