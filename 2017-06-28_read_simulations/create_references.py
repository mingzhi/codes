"""
merge a list of genome sequences for NGS simulation
"""
import os
import sys

def main():
    """main function"""
    genome_list_file = sys.argv[1]
    genomes = []
    with open(genome_list_file) as reader:
        for line in reader:
            term = line.rstrip()
            genomes.append(term)
            print(term)
    out_file = sys.argv[2]
    with open(out_file, 'w') as writer:
        for genome in genomes:
            genome_filename = genome + "_genomic.fna"
            genome_filepath = os.path.join("../genomes", genome, genome_filename)
            with open(genome_filepath) as reader:
                for line in reader:
                    writer.write(line)
if __name__ == "__main__":
    main()

