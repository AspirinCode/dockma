#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/4ZTQ_47339/output.txt

# run
python prepare_receptor.py 4ZTQ
python prepare_ligand.py 47339
sh prepare_config.sh 4ZTQ 47339

vina --out hot/4ZTQ_47339/model.pdbqt --log hot/4ZTQ_47339/report.txt --receptor data/4ZTQ.pdbqt --ligand data/47339.pdbqt --config hot/4ZTQ_47339/config.txt

python extract_score.py hot/4ZTQ_47339

rm task/4ZTQ_47339_docking.sbatch
