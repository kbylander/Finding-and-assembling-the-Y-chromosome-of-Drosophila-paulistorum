#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 1
#SBATCH -t 02:00:00 
#SBATCH -J extract_putative_Y_O11_Canu_filt_mix_0_05
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/extract_putative_Y_O11_Canu_filt_mix_0_05
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/extract_putative_Y_O11_Canu_filt_mix_0_05
#SBATCH --mail-user ellen.siggstedt.1185@student.uu.se
#SBATCH --mail-type=ALL

#Script to extract nanopore reads mapping to list of putative Y contigs

module load bioinfo-tools samtools/1.14

RESULT_ndn='/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/'
RESULT_canu='/proj/sllstore2017063/y_chromosome/nobackup/results/O11_Canu_res/'

### O11 nextdenovo assembly
#Extract reads mapping to putative Y contigs
#samtools view -@24 -L ${RESULT_ndn}04_extract_putative_Y/putative_contigs.csv \
#-b ${RESULT_ndn}01_read_mapping/sorted_O11_nanopore_aln.bam.bam \
#-o ${RESULT_ndn}04_extract_putative_Y/extracted_putative_Y_nanopore_reads.bam

#Convert to fasta format
#samtools fasta ${RESULT_ndn}04_extract_putative_Y/extracted_putative_Y_nanopore_reads.bam \
#> ${RESULT_ndn}04_extract_putative_Y/extracted_putative_Y_nanopore_reads.fasta

### O11 Canu assembly
#samtools view -@24 -L ${RESULT_canu}04_extract_putative_Y/putative_contigs.csv \
#-b ${RESULT_canu}01_read_mapping/sorted_.bam \
#-F 256 \
#-o ${RESULT_canu}04_extract_putative_Y/extracted_putative_Y_nanopore_reads_Canu_nosecondary.bam

#samtools fasta ${RESULT_canu}04_extract_putative_Y/extracted_putative_Y_nanopore_reads_Canu_nosecondary.bam \
#> ${RESULT_canu}04_extract_putative_Y/extracted_putative_Y_nanopore_reads_Canu_nosecondary.fasta

### O11 Canu assembly filt mix 0
#samtools view -@24 -L ${RESULT_canu}02_read_depth/putative_contigs_filt_mix_0.csv \
#-b ${RESULT_canu}01_read_mapping/sorted_.bam \
#-F 256 \
#-o ${RESULT_canu}04_extract_putative_Y/extracted_putative_Y_nanopore_reads_Canu_nosecondary_filt_mix_0.bam

#samtools fasta ${RESULT_canu}04_extract_putative_Y/extracted_putative_Y_nanopore_reads_Canu_nosecondary_filt_mix_0.bam \
#> ${RESULT_canu}04_extract_putative_Y/extracted_putative_Y_nanopore_reads_Canu_nosecondary_filt_mix_0.fasta

### O11 Canu assembly filt mix 0 + gene fishing hit contigs
#samtools view -@24 -L ${RESULT_canu}04_extract_putative_Y/putative_contigs_filt_mix_0+GF.csv \
#-b ${RESULT_canu}01_read_mapping/sorted_.bam \
#-F 256 \
#-o ${RESULT_canu}04_extract_putative_Y/extracted_putative_Y_nanopore_reads_Canu_nosecondary_filt_mix_0+GF.bam

#samtools fasta ${RESULT_canu}04_extract_putative_Y/extracted_putative_Y_nanopore_reads_Canu_nosecondary_filt_mix_0+GF.bam \
#> ${RESULT_canu}04_extract_putative_Y/extracted_putative_Y_nanopore_reads_Canu_nosecondary_filt_mix_0+GF.fasta

### O11 Canu assembly filt mix 0, sum mix > 0.5 for putative contigs list
samtools view -@24 -L ${RESULT_canu}02_read_depth/putative_contigs_mix_0_05.csv \
-b ${RESULT_canu}01_read_mapping/sorted_.bam \
-F 256 \
-o ${RESULT_canu}04_extract_putative_Y/extracted_putative_Y_nanopore_reads_Canu_nosecondary_filt_mix_0_05.bam

samtools fasta ${RESULT_canu}04_extract_putative_Y/extracted_putative_Y_nanopore_reads_Canu_nosecondary_filt_mix_0_05.bam \
> ${RESULT_canu}04_extract_putative_Y/extracted_putative_Y_nanopore_reads_Canu_nosecondary_filt_mix_0_05.fasta
