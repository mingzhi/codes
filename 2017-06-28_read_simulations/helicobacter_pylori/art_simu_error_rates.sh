reference_file="TC1_genomes.fna"
# reduce the substitution error rate to one 10th of the default profile
outfile="TC1_HS25_out_1"
./art_bin_MountRainier/art_illumina -ss HS25 -sam -i ${reference_file} -p -l 150 -f 5 -m 200 -s 10 -o ${outfile} -qs 10 -qs2 10
bash $NOTEBOOKS/2017-06-28_read_simulations/map_reads.sh $outfile
# increase the substitution error rate to 10 times of the default profile
outfile="TC1_HS25_out_2"
./art_bin_MountRainier/art_illumina -ss HS25 -sam -i ${reference_file} -p -l 150 -f 5 -m 200 -s 10 -o ${outfile} -qs -10 -qs2 -10
bash $NOTEBOOKS/2017-06-28_read_simulations/map_reads.sh $outfile