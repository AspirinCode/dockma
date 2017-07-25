#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/3OMV_26602/output.txt

# run
python prepare_receptor.py 3OMV
python prepare_ligand.py 26602
sh prepare_config.sh 3OMV 26602

vina --out hot/3OMV_26602/model.pdbqt --log hot/3OMV_26602/report.txt --receptor data/3OMV.pdbqt --ligand data/26602.pdbqt --config hot/3OMV_26602/config.txt

python extract_score.py hot/3OMV_26602

rm task/3OMV_26602_docking.sbatch
