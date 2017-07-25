#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/3OMV_20666/output.txt

# run
python prepare_receptor.py 3OMV
python prepare_ligand.py 20666
sh prepare_config.sh 3OMV 20666

vina --out hot/3OMV_20666/model.pdbqt --log hot/3OMV_20666/report.txt --receptor data/3OMV.pdbqt --ligand data/20666.pdbqt --config hot/3OMV_20666/config.txt

python extract_score.py hot/3OMV_20666

rm task/3OMV_20666_docking.sbatch
