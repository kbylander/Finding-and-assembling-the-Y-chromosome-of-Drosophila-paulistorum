"""
Authors: Ellen Siggstedt, 2023-01-04
"""

import sys
import csv

#Script for summarizing and filtering the result from gene fishing based on 60% of gene length in match
#input gene fishing result, output file name for result, output file name for counting genes

#Genes that are fished for
genes = {'GK21041':['CG18155', 1884], 'GK20609':['CG15580', 2334], 
'GK13929':['CG10588', 3246], 'GK28041': ['CG32650', 960], 
'GK27472': ['CG13539', 813], 'YOgnWI030283': ['CG34277', 819], 
'GK21220': ['CG6052', 5370], 'YOgnWI000172': ['CG14339', 3123], 
'GK27406': ['Piezo-like', 7074], 'GK28211': ['Ran-like', 657], 
'GK18510': ['ProtA', 582], 'GK20591': ['CG6888', 591], 
'YOgnWI018045': ['CG34175', 303], 'wilProsB6_Y1': ['Prosbeta6', 690], 
'wilProsB6_Y2': ['Prosbeta6', 690], 'wilProsB6_Y3': ['Prosbeta6', 690], 
'wilProsB6_Y4': ['Prosbeta6', 690], 'NC_024512.1:702430-704048': ['ARY', 1619], 
'NC_024512.1:3649996-3666928': ['CCY', 16933], 'NC_024512.1:573088-664173': ['kl-2', 91086], 
'NC_024512.1:336381-563165': ['kl-3', 226785], 'NC_024512.1:3561745-3618339': ['ORY', 56595], 
'NC_024512.1:1636574-1884846': ['Ppr-Y', 248273], 'NC_024512.1:c192020-146092': ['PRY', 45929], 
'NC_004353.4:879-5039': ['JYalpha', 4161]};

if __name__ == "__main__":
    with open(sys.argv[1], 'r') as gene_fishing_result, open(sys.argv[2], "w") as result_outfile, open(sys.argv[3], "w") as count_outfile:
        gene_fishing=csv.reader(gene_fishing_result, delimiter='\t')
        nr_filtered_genes={}
        result_outfile.write(f'Gene name\tContig name\tSecond gene name\tPercentage id\tGene length\tQuerystart\tQueryend\n')
        count_outfile.write(f'Gene name\tNumber of this gene after filtering\n')
        for row in gene_fishing:
            gene_length_60 = int(genes[row[0]][1])*0.6*(1/3) #60% of the corresponding gene length, multiplied by 1/3 if protein blast
            if int(row[3]) > int(gene_length_60): #filter away gene hits shorter than 60% of the gene length
                if row[0] in nr_filtered_genes:
                    nr_filtered_genes[row[0]]=nr_filtered_genes[row[0]]+1
                else:
                    nr_filtered_genes[row[0]]=1
                #write gene name, contig name, second gene name, percentage id, gene length
                result_outfile.write(f'{row[0]}\t{row[1]}\t{genes[row[0]][0]}\t{row[2]}\t{row[3]}\t{row[6]}\t{row[7]}\n')
        for key in nr_filtered_genes:
            #write gene names, number of filtered gene hits of that gene
            count_outfile.write(f'{key}\t{nr_filtered_genes[key]}\n')