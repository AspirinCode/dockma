#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/4ZTQ_31862/output.txt

# run
python prepare_receptor.py 4ZTQ
python prepare_ligand.py 31862
sh prepare_config.sh 4ZTQ 31862

vina --out hot/4ZTQ_31862/model.pdbqt --log hot/4ZTQ_31862/report.txt --receptor data/4ZTQ.pdbqt --ligand data/31862.pdbqt --config hot/4ZTQ_31862/config.txt

python extract_score.py hot/4ZTQ_31862

rm task/4ZTQ_31862_docking.sbatch
