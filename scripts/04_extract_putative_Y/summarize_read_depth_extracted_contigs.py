#Script to summarize extracted read depth data
# Input read depth file, contig list bed file, outputname

import sys
import csv

if __name__ == "__main__":
    with open(sys.argv[1], 'r') as depth_data, open(sys.argv[2], newline='') as csv_file, open(sys.argv[3], "w") as outfile:
        contigs_file=csv.reader(csv_file, delimiter='\t')
        contig_list=[]
        for cont in contigs_file:
            contig_list.append(cont[0])
        
        j=0
        depth_contig=0
        count_contig=0
        for line in depth_data:
            row = line.split()
            if row[0] == contig_list[j]:
                depth_contig+=int(row[2])
                count_contig+=1
            else:
                mean_depth=depth_contig/count_contig
                outfile.write(f'{contig_list[j]}\t{mean_depth}\n')
                j+=1
       	       	depth_contig=int(row[2])
       	       	count_contig=1
