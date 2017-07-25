#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/4ZTQ_40363/output.txt

# run
python prepare_receptor.py 4ZTQ
python prepare_ligand.py 40363
sh prepare_config.sh 4ZTQ 40363

vina --out hot/4ZTQ_40363/model.pdbqt --log hot/4ZTQ_40363/report.txt --receptor data/4ZTQ.pdbqt --ligand data/40363.pdbqt --config hot/4ZTQ_40363/config.txt

python extract_score.py hot/4ZTQ_40363

rm task/4ZTQ_40363_docking.sbatch
