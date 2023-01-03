import pandas as pd
import sys
"""
to call in terminal use 
python <name of script> <genome fasta> <contig filter list> <output file> 

The script needs to be adapted, depending on how the file looks, see usecols for example in line 12.

Current script is adopted for the D. willistoni genome. 

The output file should also be correctly named for what the purpose is. 
"""
if __name__ == "__main__":
    #Read in list of contigs
    data=pd.read_csv(sys.argv[2], sep='\t',header=None,usecols=[0],names=["contig"])
   
    #data pre-proccesing
    contigs=data['contig'].to_string(index=False)
    contigs=contigs.split("\n")

    fasta_id=[]
    fasta_seq=[]
    relevant_ind=[]

    counter=0

    #Load in data
    with open(sys.argv[1]) as f:
        fastas = f.readlines()
        
    for ind,line in enumerate(fastas):
        if ">" in line:
            print(line)
            contig_name=line.split()[0]
            fasta_id.append(contig_name)
            counter+=1
        elif len(fasta_seq) < counter:
            fasta_seq.append(line)
        else:
            fasta_seq[counter-1] += line

    genome=pd.DataFrame(columns=["id","seq"])

    for i in range(0,len(fasta_id)):
        if fasta_id[i][1:] in contigs:
            genome.loc[len(genome)] = [fasta_id[i], fasta_seq[i]]

    #Add the fastas to the dataframe if the contig name is in the list, and add ">" to the fastas for readability
    print("length of final list:",len(genome))
    print("anticipated length:",len(contigs))
    print(genome)

    genome.to_csv(sys.argv[3], sep='\n', index=False, header=False)

