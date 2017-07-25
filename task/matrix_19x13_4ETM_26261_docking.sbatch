#!/bin/bash -l

#SBATCH -t 10:00:00
#SBATCH --qos=high-throughput
#SBATCH -o hot/4ETM_26261/output.txt

# run
python prepare_receptor.py 4ETM
python prepare_ligand.py 26261
sh prepare_config.sh 4ETM 26261

vina --out hot/4ETM_26261/model.pdbqt --log hot/4ETM_26261/report.txt --receptor data/4ETM.pdbqt --ligand data/26261.pdbqt --config hot/4ETM_26261/config.txt

python extract_score.py hot/4ETM_26261

rm task/4ETM_26261_docking.sbatch
