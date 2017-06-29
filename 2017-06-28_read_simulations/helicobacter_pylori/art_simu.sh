#!/usr/bin/bash
# Next-gen sequencing simulation using ART
# Working directory: /scratch/ml3365/genomes/Gits/Helicobacter_pylori/assembly/simulation
# Created at 2017-06-28

# change to working directory
wdir="/scratch/ml3365/genomes/Gits/Helicobacter_pylori/assembly/simulation"
cd $wdir

# we simulate Illumina 2500 sequencing reads for the 12 transformants genomes at coverage of 5
# first prepare reference genome
create_reference_py=$NOTEBOOKS/2017-06-28_read_simulations/create_references.py
genome_list_file="../genome_list/TC1_genomes.txt"
reference_file="TC1_genomes.fna"
python $create_reference_py $genome_list_file $reference_file
outfile="TC1_HS25_out"
./art_bin_MountRainier/art_illumina -ss HS25 -sam -i ${reference_file} -p -l 150 -f 5 -m 200 -s 10 -o ${outfile}

genome_list_file="../genome_list/parent_genomes.txt"
reference_file="recipient_genomes.fna"
python $create_reference_py $genome_list_file $reference_file
outfile="recipient_out"
./art_bin_MountRainier/art_illumina -ss HS25 -sam -i ${reference_file} -p -l 150 -f 50 -m 200 -s 10 -o ${outfile}
