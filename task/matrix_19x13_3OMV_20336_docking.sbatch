#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/3OMV_20336/output.txt

# run
python prepare_receptor.py 3OMV
python prepare_ligand.py 20336
sh prepare_config.sh 3OMV 20336

vina --out hot/3OMV_20336/model.pdbqt --log hot/3OMV_20336/report.txt --receptor data/3OMV.pdbqt --ligand data/20336.pdbqt --config hot/3OMV_20336/config.txt

python extract_score.py hot/3OMV_20336

rm task/3OMV_20336_docking.sbatch
