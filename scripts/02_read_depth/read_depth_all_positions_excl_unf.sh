#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 6
#SBATCH -t 10:00:00
#SBATCH -J depth_all
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/191222_read_depth
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/191222_read_depth
#SBATCH --mail-user ellen.siggstedt.1185@student.uu.se
#SBATCH --mail-type=FAIL,END

module load bioinfo-tools samtools

READS=/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/01_read_mapping/
RESULT=/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/02_read_depth

READS_CANU=/proj/sllstore2017063/y_chromosome/nobackup/results/O11_Canu_res/01_read_mapping/
RESULT_CANU=/proj/sllstore2017063/y_chromosome/nobackup/results/O11_Canu_res/02_read_depth/


cd $READS
# UNMAP, SECONDARY, QCFAIL, or DUP are skipped, meaning we only compare uniquely mapped reads
# If you want to know which column in the output is which sample, look in sorted_illumina.txt. They're in the same order
# The unfertilized sample is excluded from this analysis

#Nextdenovo assembly
#samtools depth -f $RESULT/sorted_illumina.txt -aa -Q 10 -o $RESULT/read_depth_all_positions_illumina.out

#samtools depth sorted_O11_nanopore_aln.bam.bam -aa -Q 10 -o $RESULT/read_depth_all_positions_nanopore.out

#Canu assembly
cd $READS_CANU
#samtools depth -f sorted_illumina_list.txt -aa -Q 10 -o $RESULT_CANU/read_depth_all_positions_illumina.out

samtools depth sorted_.bam -aa -Q 10 -o $RESULT_CANU/read_depth_all_positions_nanopore.out

