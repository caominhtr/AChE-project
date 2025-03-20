#! /bin/bash

for i in {1..368}; do
    f="cpd${i}.pdbqt"
    if [ -f "$f" ]; then
        b=$(basename "$f" .pdbqt)
        echo "Processing $b"
        mkdir -p "$b"
        vina --config config.txt --receptor 7xn1.pdbqt --ligand "$f" > "${b}/out_${b}.txt"
    else
        echo "File $f not found."
    fi
done
