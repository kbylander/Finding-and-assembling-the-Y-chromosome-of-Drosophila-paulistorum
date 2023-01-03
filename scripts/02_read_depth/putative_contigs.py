import pandas as pd
import numpy as np

"""
Author: Karl Bylander, 2023-01-03

Finds the putative contigs, which fullfills condition of the if-statement on row 28.
"""

#names of the input files, from the chang & Larracuente scipt. 
colnames=["contig", "base", "i"," sum f","sum mixed", "average ratio", " median ratio"]

data=pd.read_csv("average_normalised_samples_2.out", sep='\t',names=colnames)

#create empty lists
putative_contigs=[]
contigs_freq=[]
contig_length=[]

# count lengths of contigs. 
occur=pd.DataFrame()
occur["occurences"] = data.groupby(['contig']).size()
occur["occurences"]= occur["occurences"].apply(lambda x: (x*10000-5000))

#for every instans, if the mean ratio is 0 and mixed > 0, save the contig and add 1 to corresponding index in frequency.
for i in range(0,len(data["contig"])):
    if (data["average ratio"][i] == 0 and data["sum mixed"][i] > 0):
        
        #If the contig hasn't already been found, create the entry, otherwise add one. 
        if data["contig"][i] not in putative_contigs:
            putative_contigs.append(data["contig"][i])
            contigs_freq.append(1)
        else:
            index=putative_contigs.index(data["contig"][i])
            contigs_freq[index] += 1

#Put it in a dataframe
put_cont=pd.DataFrame()
put_cont["contigs"]=putative_contigs

#Find intersecting contigs.
occur = occur[occur.index.isin(put_cont["contigs"])]

put_cont["start_pos"]=0
put_cont["length"]=occur.values
put_cont["c4"]="Mockvalues"
put_cont["frequencies"]=contigs_freq

#Upload as csv
put_cont.to_csv("./putative_contigs.csv", sep='\t', index=False, header=False, encoding='utf-8')
