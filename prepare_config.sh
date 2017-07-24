cat data/$1.pdb | grep -e '^ATOM' -e '^HETATM' | awk '{printf "%s\t%s\t%s\n",$7,$8,$9}' | python prepare_config.py $1 $2

