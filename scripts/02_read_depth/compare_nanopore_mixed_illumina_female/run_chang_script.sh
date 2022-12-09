#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 1
#SBATCH -t 00:30:00 
#SBATCH -J run_chang_script
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/run_chang_script
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/run_chang_script
#SBATCH --mail-user ellen.siggstedt.1185@student.uu.se
#SBATCH --mail-type=FAIL,END

module load bioinfo-tools perl/5.26.2

RESULT='/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/02_read_depth/compare_nanopore_mixed_illumina_female/'

perl frame_depth_new.pl ${RESULT}/merged_nanopore_mixed_illumina_female.out
