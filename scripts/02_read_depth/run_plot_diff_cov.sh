#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 1
#SBATCH -t 00:10:00
#SBATCH -J plot_diff_cov
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/plot_diff_cov
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/plot_diff_cov
#SBATCH --mail-user kalle.99@live.com
#SBATCH --mail-type=FAIL,END

CURR="/crex/proj/sllstore2017063/y_chromosome/Finding-and-assembling-the-Y-chromosome-of-Drosophila-paulistorum/scripts/02_read_depth"
cd /crex/proj/sllstore2017063/y_chromosome/nobackup/results/O11_Canu_res/02_read_depth
module load python

python ${CURR}/plot_diff_cov.py average_F_M_depth_filt_male0.out cov_ratio.png mixed_fem_cov.png
