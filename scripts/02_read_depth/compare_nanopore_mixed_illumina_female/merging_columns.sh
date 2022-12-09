#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 1
#SBATCH -t 00:30:00 
#SBATCH -J merging_columns
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/merging_columns
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/merging_columns
#SBATCH --mail-user ellen.siggstedt@student.uu.se
#SBATCH --mail-type=FAIL,END

module load bioinfo-tools

RESULT='/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/02_read_depth/compare_nanopore_mixed_illumina_female/'

paste <(awk '{print $1}' ${RESULT}average_normalised_samples.out) \
<(awk '{print $2}' ${RESULT}average_normalised_samples.out) \
<(awk '{print $3}' ${RESULT}average_normalised_samples.out) \
<(awk '{print $3}' ${RESULT}samp1_normalised.out) > ${RESULT}merged_nanopore_mixed_illumina_female.out
