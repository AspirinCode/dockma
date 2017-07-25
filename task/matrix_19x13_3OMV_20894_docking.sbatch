#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/3OMV_20894/output.txt

# run
python prepare_receptor.py 3OMV
python prepare_ligand.py 20894
sh prepare_config.sh 3OMV 20894

vina --out hot/3OMV_20894/model.pdbqt --log hot/3OMV_20894/report.txt --receptor data/3OMV.pdbqt --ligand data/20894.pdbqt --config hot/3OMV_20894/config.txt

python extract_score.py hot/3OMV_20894

rm task/3OMV_20894_docking.sbatch
