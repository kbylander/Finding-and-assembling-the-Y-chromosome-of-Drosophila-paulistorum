import pandas as pd
import matplotlib.pyplot as plt

data=pd.read_csv("average_normalised_samples_2.out",usecols=[3,4,5],header=None,sep="\t")

plt.hist(data[5],bins=1000,color="r",label="Mean coverage ratio (Female & Mixed)")
plt.title("Mean coverage ratio (Female & Mixed)")
plt.ylabel("Occurences")
plt.xlabel("Ratio (Female & Mixed)")
plt.xlim(0,1.7)
#plt.ylim(0,200)
plt.show()

#female
plt.hist(data[3],bins=500,color="r",alpha=0.3,label="sum of female")
plt.title("Sum of coverage between samples")
plt.xlabel("Coverage")
plt.ylabel("Occurences")
plt.legend()
plt.xlim(0,8000)

#mixed
plt.hist(data[4],bins=500,color="b",alpha=0.3,label="sum of mixed")
plt.legend()
plt.xlim(0,8000)
plt.show()
