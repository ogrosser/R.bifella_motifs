# R.bifella_motifs
This project demonstrates a way to discern the most common motif in R.bifella using bash, if given a list of motifs.

The input files are:
1. interesting_motifs.txt (contains list of 10 motifs)
2. r_bifella.fasta

The output files are:
1. motif directory (contains below FASTA files)
2. motif_count.txt (contains each motif and the number of occurances)
3. "motif".fasta (FASTA files for each motif that contain all the genes and their corresponding sequences that have said motif

To execute this script, enter the following into a Linux terminal:
    bash r_bif_motifs.sh
