#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 1
#SBATCH -t 01:00:00 
#SBATCH -J job_name
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/ #write slurm log name here
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/ #write same slurm log name here
#SBATCH --mail-user name.lastname@student.uu.se
#SBATCH --mail-type=FAIL,END

module load bioinfo-tools

O11='/proj/sllstore2017063/y_chromosome/rawdata/O11_data/'
other='/proj/sllstore2017063/y_chromosome/rawdata/other_data/'
result='/proj/sllstore2017063/y_chromosome/nobackup/results/'
