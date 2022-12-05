#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 3
#SBATCH -t 02:00:00
#SBATCH -J normalise_by_median
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/norm_samples_20221125
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/norm_samples_20221125
#SBATCH --mail-user kalle.99@live.com
#SBATCH --mail-type=FAIL,END

module load python

python norm_by_column.py read_depth_all_positions_illumina.out

