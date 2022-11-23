"""
This script combines samples into an 'average sample'
Input should be a samtools depth output file with 8 samples
the first four are assumed to be mixed sexes
the last four are assumed to be female only
Give a name for the output file (that doesn't already exist and ends w/ .out)
The output will have columns: contig, POS, Female average, Mixed average
to better fit the frame_depth_new.pl by Chang and Larracuente
"""
import sys

if __name__ == "__main__":
    
    with open(sys.argv[1]) as infile, \
        open(sys.argv[2], "x") as outfile:
            for line in infile:
                row = line.split() #split each line to get data in list
                #convert depth from string to float
                for col in range(2,10):
                    row[col] = int(row[col])
            
                f_average = (sum(row[6:10])/4)
                mix_average = (sum(row[2:6])/4)
                #calculations
                #print the results
                outfile.write(f'{row[0]}\t{row[1]}\t{f_average}\t{mix_average}\n')
