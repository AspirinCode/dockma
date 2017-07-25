#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/3OMV_31862/output.txt

# run
python prepare_receptor.py 3OMV
python prepare_ligand.py 31862
sh prepare_config.sh 3OMV 31862

vina --out hot/3OMV_31862/model.pdbqt --log hot/3OMV_31862/report.txt --receptor data/3OMV.pdbqt --ligand data/31862.pdbqt --config hot/3OMV_31862/config.txt

python extract_score.py hot/3OMV_31862

rm task/matrix_19x13_3OMV_31862_docking.sbatch
