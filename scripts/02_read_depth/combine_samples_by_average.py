#Parameter 1: (preferably) a normalized samtools depth output file
# with 4 mixed samples on columns 3-6
# and 4 Female only samples on columns 7-10
# Parameter 2: name for output file.
# The output will have female samples in column 3
# and mixed samples in column 4, to better match the frame_depth_new.pl script from Chang and Larracuente

import sys

if __name__ == "__main__":

    with open(sys.argv[1]) as infile, \
        open(sys.argv[2], "x") as outfile:
            for line in infile:
                row = line.split() #split each line to get data in list
                #convert depth from string to float
                for col in range(2,10):
                    row[col] = float(row[col])

                f_average = (sum(row[6:10])/4)
                mix_average = (sum(row[2:6])/4)
                #calculations
                #print the results
                outfile.write(f'{row[0]}\t{row[1]}\t{f_average}\t{mix_average}\n')

