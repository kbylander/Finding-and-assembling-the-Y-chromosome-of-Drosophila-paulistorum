#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 1
#SBATCH -t 01:00:00 
#SBATCH -J extract_putative_Y_O11
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/extract_putative_Y_O11
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/extract_putative_Y_O11
#SBATCH --mail-user ellen.siggstedt.1185@student.uu.se
#SBATCH --mail-type=FAIL,END

module load bioinfo-tools samtools/1.14

RESULT='/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/'

samtools view -@24 -L ${RESULT}02_read_depth/putative_contigs.csv \
-b ${RESULT}01_read_mapping/sorted_O11_nanopore_aln.bam.bam | \
samtools fasta - > ${RESULT}04_extract_putative_Y/extracted_putative_Y_nanopore_reads.fasta
