#!/bin/bash

echo -e 'Hello. This script can be used to show the most frequent motif across the R.bifella genome\nand can be executed by typing bash r_bif_motifs.sh in your directory.'
echo 'Refer to the readme file for more detailed description and instructions.'

mkdir motifs #Creates directory that will contain motif FASTA files.
touch motif_count.txt #Creates text file that will contain all motifs plus number of occurances.

#Copies input files to your current directory.
cp -r input_files/interesting_motifs.txt input_files/r_bifella.fasta .

while read -r line #Reads each line in interesting_motifs.txt. Each line is a different motif.
do
    touch $line.fasta #Creates FASTA file for each motif
    c=$(grep -o $line r_bifella.fasta | wc -l) #Counts how many occurances for each motif in r_bifella.fasta
    echo "$line $c" >> motif_count.txt #Outputs each motif and the number of occurances in motif_count.txt
    if grep -q $line r_bifella.fasta #If there is an occurance of each motif:
    then
        grep -B 1 $line r_bifella.fasta | grep -v "^--" >> $line.fasta #Ouputs gene name and sequence that has each motif into FASTA file
    fi
    mv $line.fasta motifs #Moves FASTA file into the motifs directory
done < interesting_motifs.txt
rm interesting_motifs.txt r_bifella.fasta #Removes input files from your current directory.