import pandas as pd
import matplotlib.pyplot as plt
import sys

"""
Author: Karl Bylander, 2023-01-03
sys.argv[1] : data file, from Chang & Larracuente (2019) script.
sys.argv[2] : 1 png name
sys.argv[3] : 2 png name

Might need to adapt x and y lim. 

"""
if __name__ == "__main__":  

    data=pd.read_csv(sys.argv[1],usecols=[3,4,5],header=None,sep="\t")

    plt.hist(data[5],bins=1000,color="r",label="Mean coverage ratio (Female & Mixed)")
    plt.title("NDN-Full: Mean coverage ratio (Female & Mixed)")
    plt.ylabel("Occurences")
    plt.xlabel("Ratio (Female & Mixed)")
    plt.xlim(0,1.7)
    #plt.ylim(0,200)
    plt.show()
    plt.savefig(sys.argv[2])

    #female
    plt.hist(data[3],bins=1000,color="r",alpha=0.3,label="sum of female")
    plt.title("NDN-Full: Sum of coverage between samples")
    plt.xlabel("Coverage")
    plt.ylabel("Occurences")
    plt.legend()
    plt.xlim(0,8000)

    #mixed
    plt.hist(data[4],bins=1000,color="b",alpha=0.3,label="sum of mixed")
    plt.legend()
    plt.xlim(0,8000)
    plt.show()
    plt.savefig(sys.argv[3])

