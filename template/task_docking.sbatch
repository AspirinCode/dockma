#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/PID_CID/output.txt

# run
python prepare_receptor.py PID
python prepare_ligand.py CID
sh prepare_config.sh PID CID

vina --out hot/PID_CID/model.pdbqt --log hot/PID_CID/report.txt --receptor data/PID.pdbqt --ligand data/CID.pdbqt --config hot/PID_CID/config.txt

python extract_score.py hot/PID_CID

rm task/PROJECT_PID_CID_docking.sbatch
