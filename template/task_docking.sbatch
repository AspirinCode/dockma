#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/PID_CID/output.txt

# run
python prepare_receptor.py PID
python prepare_ligand.py CID
sh prepare_config.sh PID CID

python docking.py PID CID

python extract_score.py hot/PID_CID

rm task/PROJECT_PID_CID_docking.sbatch
