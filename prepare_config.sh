cat data/$1.pdb | grep -e '^ATOM' -e '^HETATM' | python pdb_parse_atom.py | python prepare_config.py $1 $2

