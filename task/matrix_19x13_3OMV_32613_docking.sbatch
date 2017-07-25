#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/3OMV_32613/output.txt

# run
python prepare_receptor.py 3OMV
python prepare_ligand.py 32613
sh prepare_config.sh 3OMV 32613

vina --out hot/3OMV_32613/model.pdbqt --log hot/3OMV_32613/report.txt --receptor data/3OMV.pdbqt --ligand data/32613.pdbqt --config hot/3OMV_32613/config.txt

python extract_score.py hot/3OMV_32613

rm task/3OMV_32613_docking.sbatch
