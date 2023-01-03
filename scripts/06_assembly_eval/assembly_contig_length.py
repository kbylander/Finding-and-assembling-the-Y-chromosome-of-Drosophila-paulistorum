import pandas as pd
import matplotlib.pyplot as plt

""""
Author: Karl Bylander, 2023-01-03

"""
#assembly_info.txt input
data_new=pd.read_csv("assembly_info.txt", sep='\t',usecols=[0,1,2])

#Fasta file input
data_old=pd.read_csv("CANU-PY.fasta",header=None)
print(data_old)
seq=[]
ids=[]
mean= data_new["cov."].mean()
print(mean)

for ind,i in enumerate(data_old[0]):
    if ">" in i:
        ids.append(i)
    elif len(seq) == len(ids):
        seq[len(ids)-1]+=len(i)
    else:
        seq.append(len(i))

print(data_new)
length=0
contigs=[]

for i in range(0,len(data_new)):
    if data_new["cov."][i] >= 0:
        length+=data_new["length"][i]

        contigs.append(data_new["#seq_name"][i])

print(length)
print(len(ids))
tot=0
for i in seq:
    tot+=i

print("here",sum(seq))

plt.hist(data_new["length"],bins=35,color="r",label="NDN-FLYE-DCA",alpha=0.4)
plt.legend()


plt.hist(seq,bins=35,color="g",label="NDN-PY",alpha=0.4)
plt.legend()

plt.xlabel("Length")
plt.ylabel("Count")
plt.title("Contig analysis of NDN-PY and NDN-FLYE-DCA")
plt.grid(axis="y")
plt.yscale("log")

plt.show()


#data_new.drop(data_new.loc[data_new['cov.']>90].index, inplace=True)

plt.scatter(range(0,len(data_new["#seq_name"])),data_new["length"],s=20,c=data_new["cov."],cmap="plasma")
plt.legend()
plt.xlabel("Contig count")
plt.ylabel("Length")
plt.title("Contig length and coverage of NDN-FLYE-DCA")
plt.colorbar(label="Coverage")
plt.grid(axis="y")
plt.show()
