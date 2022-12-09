#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 8
#SBATCH -t 00:05:00
#SBATCH -J map_illumina_fly_assembly
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/map_illumina_fly_assembly
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/map_illumina_fly_assembly
#SBATCH --mail-user ellen.siggstedt.1185@student.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools bwa/0.7.17 samtools/1.14

RESULT='/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/'
#R1_ILLUMINA_MIXED='/proj/sllstore2017063/y_chromosome/rawdata/O11_data/short_read_data/O11*R1*'
DATA = '/proj/sllstore2017063/y_chromosome/rawdata/O11_data/short_read_data/'

#Construct FM-index of the reference (assembled putative Y nanopore contigs)
#bwa index ${RESULT}05_assemblies/flye_assembler_nanopore/assembly.fasta

#for i in ${R1_ILLUMINA_MIXED}
#do
#    R2_PAIRED=${i/_R1.fastq.gz/_R2.fastq.gz}
#    NAME=$(basename $i _R1.fastq.gz)
#    bwa mem -t 8 ${RESULT}05_assemblies/flye_assembler_nanopore/assembly.fasta \
#    ${i} ${R2_PAIRED} \
#    | samtools sort -@4 -o ${RESULT}/05_assemblies/mapped_illumina_nanopore_sorted_${NAME}.bam
#done

bwa mem -t 8 ${RESULT}05_assemblies/flye_assembler_nanopore/assembly.fasta \
${DATA}O11_Sample_TL-2788-O11-0-1-2_R1.fastq.gz ${DATA}O11_Sample_TL-2788-O11-0-1-2_R2.fastq.gz \
| samtools sort -@8 -o ${RESULT}/05_assemblies/mapped_illumina_nanopore_sorted-0_1_2.bam

bwa mem -t 8 ${RESULT}05_assemblies/flye_assembler_nanopore/assembly.fasta \
${DATA}O11_Sample_TL-2788-O11-10-11_R1.fastq.gz ${DATA}O11_Sample_TL-2788-O11-10-11_R2.fastq.gz \
| samtools sort -@8 -o ${RESULT}/05_assemblies/mapped_illumina_nanopore_sorted-10_11.bam

bwa mem -t 8 ${RESULT}05_assemblies/flye_assembler_nanopore/assembly.fasta \
${DATA}O11_Sample_TL-2788-O11-18-20_R1.fastq.gz ${DATA}O11_Sample_TL-2788-O11-18-20_R2.fastq.gz \
| samtools sort -@8 -o ${RESULT}/05_assemblies/mapped_illumina_nanopore_sorted-18_20.bam

bwa mem -t 8 ${RESULT}05_assemblies/flye_assembler_nanopore/assembly.fasta \
${DATA}O11_Sample_TL-2788-O11-3-4_R1.fastq.gz ${DATA}O11_Sample_TL-2788-O11-3-4_R2.fastq.gz \
| samtools sort -@8 -o ${RESULT}/05_assemblies/mapped_illumina_nanopore_sorted-3-4.bam
