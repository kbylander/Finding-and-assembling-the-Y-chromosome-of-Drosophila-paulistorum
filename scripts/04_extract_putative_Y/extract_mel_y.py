import pandas as pd
import sys

"""
python <script name> <genome.fasta> <output file>
Current script is adopted for the D. willistoni genome. 
For D. paulistorum these two lines should be used instead of the current code lines on line 17 and 24):

"""

#Read in list of contigs

counter=0
fasta_id=[]
fasta_seq=[]
relevant_ind=[]


#Load in data
if __name__ == "__main__":

    with open(sys.argv[1]) as f:
        fastas = f.readlines()

    for ind,line in enumerate(fastas):
        if ">" in line:
            print(counter)
            contig_name=line.split()[0]
            fasta_id.append(contig_name)
            counter+=1
        elif len(fasta_seq) < counter:
            fasta_seq.append(line)
        else:
            fasta_seq[counter-1] += line

    genome=pd.DataFrame(columns=["id","seq"])

    for i in range(0,len(fasta_id)):
        if "Y_" in fasta_id[i][1:] and i != 0:
            print(fasta_id[i])
            for ch in range(0,len(fasta_seq[i]),80):
                    fasta_seq[i]=fasta_seq[i][:ch] + "\n" + fasta_seq[i][ch:]
            genome.loc[len(genome)] = [fasta_id[i], fasta_seq[i]]

    #Add the fastas to the dataframe if the contig name is in the list, and add ">" to the fastas for readability
    print(len(genome))
    print(genome)

    genome.to_csv(sys.argv[2], sep='\n', index=False, header=False)

