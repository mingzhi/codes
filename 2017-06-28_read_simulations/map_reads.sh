#!/usr/bin/bash
# Map simulated reads to reference genomes using SMALT
# and calculate correlation function using meta_p2
# Created on 2017-06-28

module load samtools/intel

prefix=$1
smalt map -n 20 ../references/NC_000915.fasta ${prefix}1.fq ${prefix}2.fq | samtools view -h -F 4 - | samtools sort -@ 20 - -o ${prefix}_smalt.bam
meta_p2 --gff-file ../references/NC_000915.gff ${prefix}_smalt.bam ${prefix}_smalt.csv
$NOTEBOOKS/2017-06-28_read_simulations/FitP2.py ${prefix}_smalt.csv ${prefix}_smalt --by_p4
