#Script to extract read depth data for list of contigs
# Input read depth file, contig list bed file, outputname

import sys
import csv

if __name__ == "__main__":
    with open(sys.argv[1], 'r') as depth_data, open(sys.argv[2], newline='') as csv_file, open(sys.argv[3], "w") as outfile:
        contigs_file=csv.reader(csv_file, delimiter='\t')
        contig_list=[]
        for c in contigs_file:
            contig_list.append(c[0])
        #print(contig_list)
        for line in depth_data:
            row = line.split()
            #print(row)
            if row[0] in contig_list:
                outfile.write(f'{row[0]}\t{row[1]}\t{row[2]}\n')
