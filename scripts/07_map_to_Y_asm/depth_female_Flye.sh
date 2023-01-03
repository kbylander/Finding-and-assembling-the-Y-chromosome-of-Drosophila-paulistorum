#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 1
#SBATCH -t 04:00:00 
#SBATCH -J depth_female_Flye
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/depth_female_Flye
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/depth_female_Flye
#SBATCH --mail-user ellen.siggstedt.1185@student.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools samtools/1.14

RESULT='/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/07_map_to_Y_asm'

samtools depth ${RESULT}/sorted_Sample_O11_F.bam -a -o $RESULT/read_depth_female_Flye_O11_F.out

samtools depth ${RESULT}/sorted_Sample_OR.bam -a -o $RESULT/read_depth_female_Flye_OR.out

samtools depth ${RESULT}/sorted_Sample_OR_old.bam -a -o $RESULT/read_depth_female_Flye_OR_old.out

samtools depth ${RESULT}/sorted_Sample_OR_young.bam -a -o $RESULT/read_depth_female_Flye_O11_OR_young.out
