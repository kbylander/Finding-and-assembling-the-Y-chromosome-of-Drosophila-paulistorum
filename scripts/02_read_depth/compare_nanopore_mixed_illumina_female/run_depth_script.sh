#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 3
#SBATCH -t 02:00:00
#SBATCH -J normalise_by_median_nanopore
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/norm_samples_nanopore
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/norm_samples_nanopore
#SBATCH --mail-user ellen.siggstedt.1185@student.uu.se
#SBATCH --mail-type=FAIL,END

module load bioinfo-tools python

python /crex/proj/sllstore2017063/y_chromosome/Finding-and-assembling-the-Y-chromosome-of-Drosophila-paulistorum/scripts/02_read_depth/compare_nanopore_mixed_illumina_female/norm_by_column.py \
/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/02_read_depth/compare_nanopore_mixed_illumina_female/read_depth_all_positions_nanopore.out
