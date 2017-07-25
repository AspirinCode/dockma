#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/4ZTQ_32613/output.txt

# run
python prepare_receptor.py 4ZTQ
python prepare_ligand.py 32613
sh prepare_config.sh 4ZTQ 32613

vina --out hot/4ZTQ_32613/model.pdbqt --log hot/4ZTQ_32613/report.txt --receptor data/4ZTQ.pdbqt --ligand data/32613.pdbqt --config hot/4ZTQ_32613/config.txt

python extract_score.py hot/4ZTQ_32613

rm task/4ZTQ_32613_docking.sbatch
