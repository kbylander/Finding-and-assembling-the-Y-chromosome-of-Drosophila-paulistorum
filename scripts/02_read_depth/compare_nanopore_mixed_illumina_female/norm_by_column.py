#Script for normalizing depth output per sample

import pandas as pd
import sys

#Input 1 a depth file with 1 sample
#output file names will be <columnname>.csv and will contain contig name and normalized values of given column. 
colnames=['contig','base','samp1']

if __name__ == "__main__":
    infile = sys.argv[1]
    #read input file as dataframe and make a header
    for i in range(2,len(colnames)):
        print(f"starting with: {colnames[i]}")
        cols=[0,1,i]
        data=pd.read_csv(infile, sep='\t',usecols=cols,names=[colnames[0],colnames[1],colnames[i]])
        #calculate the median depth for each sample
        #and normalise by dividing each value in a sample with the median*2
        outfile = colnames[i] + "_normalised" + ".out"
        median2=data[colnames[i]].median()*2
        print(median2)
        if median2 != 0:
            data[colnames[i]]=data[colnames[i]].div(median2)
	
        #make new file for normalized values
        data.to_csv(outfile, sep='\t', index=False, header=False, encoding='utf-8')
        print(f"done with: {colnames[i]}")
