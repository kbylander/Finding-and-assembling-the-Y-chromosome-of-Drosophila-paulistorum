#Script to summarize extracted read depth data
# Input read depth file, contig list bed file, outputname

import sys
import csv
import math
if __name__ == "__main__":
    with open(sys.argv[1], 'r') as depth_data, open(sys.argv[2], newline='') as csv_file, open(sys.argv[3], "w") as outfile:
        contigs_file=csv.reader(csv_file, delimiter='\t')
        contig_list=[]
        depth_list=[]
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
                depth_list.append(int(row[2]))
            else:
                mean_depth=depth_contig/count_contig
                std_dev=0
               
                for i in depth_list:
                    std_dev+=(i-mean_depth)**2
                std_dev=math.sqrt(std_dev/count_contig)
                outfile.write(f'{contig_list[j]}\t{round(mean_depth, 2)}\t{round(std_dev, 2)}\n')
                j+=1
       	       	depth_contig=int(row[2])
       	       	count_contig=1
                depth_list=[]
                
        mean_depth=depth_contig/count_contig
        for i in depth_list:
            std_dev+=(i-mean_depth)**2
        std_dev=math.sqrt(std_dev/count_contig)
        print("last mean depth: ",mean_depth)
        print("last std dev: ",std_dev)
