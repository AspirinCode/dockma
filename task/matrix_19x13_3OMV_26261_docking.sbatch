#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/3OMV_26261/output.txt

# run
python prepare_receptor.py 3OMV
python prepare_ligand.py 26261
sh prepare_config.sh 3OMV 26261

vina --out hot/3OMV_26261/model.pdbqt --log hot/3OMV_26261/report.txt --receptor data/3OMV.pdbqt --ligand data/26261.pdbqt --config hot/3OMV_26261/config.txt

python extract_score.py hot/3OMV_26261

rm task/3OMV_26261_docking.sbatch
