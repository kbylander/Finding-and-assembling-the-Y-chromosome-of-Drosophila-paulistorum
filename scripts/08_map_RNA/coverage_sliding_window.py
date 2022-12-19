import sys 
import pandas as pd
import matplotlib.pyplot as plt

"""
sys.argv[1] : men cov file
sys.argv[2] : fem cov file
sys.argv[3] : windowsize

"""

if __name__ == "__main__":   
#read the data
    data_m = pd.read_csv(sys.argv[1], sep='\t', header=None, names=["cov"], usecols=[2])
    data_m["cov"] = data_m["cov"] / data_m["cov"].max()

    data_f = pd.read_csv(sys.argv[2],sep="\t", header=None ,names=["cov"] ,usecols=[2])
    data_f["cov"] = data_f["cov"] / data_f["cov"].max()

    windowsize=int(sys.argv[3])
    longest_list=len(data_m)
    men_cov=[]
    fem_cov=[]
    ratio=[]
    if len(data_f) > len(data_m): longest_list=len(data_f)
    previous_index=0
#calculate window mean
    for i in range(0,longest_list,windowsize):
        if i != 0:
            men_cov.append(data_m.iloc[previous_index:i]["cov"].mean())
            fem_cov.append(data_f.iloc[previous_index:i]["cov"].mean())
            print(i/longest_list)
            previous_index=i
            ratio.append(men_cov[-1]-fem_cov[-1])
    
#plot the data 
    plt.scatter(list(range(0,len(men_cov))),men_cov,color="r",alpha=0.32,s=10,label="Male")
    plt.xlabel(f'Position ({windowsize} bp)')
    plt.ylabel("Mean coverage")
    plt.title("RNA coverage (Male & Female)")
    plt.legend()
    plt.scatter(list(range(0,len(fem_cov))),fem_cov,color="g",alpha=0.32,s=10,label="Female")
    plt.legend()

    plt.show()

    plt.scatter(list(range(0,len(ratio))),ratio,s=10)
    plt.xlabel(f"Position ({windowsize} bp)")
    plt.ylabel("Difference (Male-Female)")
    plt.title("RNA coverage (Male & Female)")
    plt.show()
