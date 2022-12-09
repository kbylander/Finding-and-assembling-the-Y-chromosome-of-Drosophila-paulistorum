import sys
import pandas as pd
from Bio import SeqIO

#sys.argv[1] is the name of the contig list
#sys.argv[2] is the whole fasta file
#sys.argv[3] is the output file

#the script does however need to be adapted, depending on how the file looks, see usecols for example in line 12.

if __name__ == "__main__":
    data_all=pd.read_csv(sys.argv[1], sep='\t',usecols=[0],header=None,names=["contig"])
    fasta_sequences = SeqIO.parse(open(sys.argv[2]),'fasta')
    genome=pd.DataFrame(columns=["fasta","sequence"])
    contigs=data_all['contig'].to_string(index=False)
    contigs=contigs.split("\n")
    print(contigs)
    for fasta in fasta_sequences:
       print(fasta.id)
       if fasta.id in contigs:
            genome.loc[len(genome)] = [fasta.id, str(fasta.seq)]

    print("Number of contigs fetched: ",len(genome))
    genome.to_csv(sys.argv[3], sep='\n', index=False, header=False)


