#Script for normalizing depth output per sample

import pandas as pd
import sys

#Input 1 a depth file with 8 samples
#Input 2 name for output-file

if __name__ == "__main__":
    #read input file as dataframe and make a header
    data=pd.read_csv(sys.argv[1], sep=' ', 
                 names=['contig','base','samp1','samp2','samp3',
                        'samp4','samp5','samp6','samp7','samp8'])
    #calculate the median depth for each sample
    #and normalise by dividing each value in a sample with the median*2
    for col in ['samp1','samp2','samp3','samp4',
                'samp5','samp6','samp7','samp8']:
        median2=data[col].median()*2
        if median2 != 0:
            data[col]=data[col].div(median2)
    
    #make new file for normalized values        
    data.to_csv(sys.argv[2], sep='\t', index=False, header=False,
                encoding='utf-8', lineterminator='\n')
