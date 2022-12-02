#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 1
#SBATCH -t 01:00:00 
#SBATCH -J run_read_depth_nanopore
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/run_read_depth_nanopore
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/run_read_depth_nanopore
#SBATCH --mail-user ellen.siggstedt.1185@student.uu.se
#SBATCH --mail-type=FAIL,END

module load bioinfo-tools perl/5.26.2

result='/proj/sllstore2017063/y_chromosome/nobackup/results/'
script='/proj/sllstore2017063/y_chromosome/Finding-and-assembling-the-Y-chromosome-of-Drosophila-paulistorum/scripts/'

perl ${script}read_depth_nanopore.pl ${result}/D_paulistorum_O11_res/01_read_mapping/read_depth_nanopore.out
