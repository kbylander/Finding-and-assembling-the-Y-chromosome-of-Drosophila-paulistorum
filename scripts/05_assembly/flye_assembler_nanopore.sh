#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core
#SBATCH -n 16
#SBATCH --mem 100GB
#SBATCH -t 20:00:00 
#SBATCH -J flye_assembler_nanopore_Canu_filt_mix_0+GF
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/flye_assembler_nanopore_Canu_filt_mix_0+GF
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/flye_assembler_nanopore_Canu_filt_mix_0+GF
#SBATCH --mail-user ellen.siggstedt.1185@student.uu.se
#SBATCH --mail-type=ALL

#Script to assembly extracted Y reads using Flye assembler

module load bioinfo-tools Flye/2.9.1

RESULT_ndn='/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/'
RESULT_canu='/proj/sllstore2017063/y_chromosome/nobackup/results/O11_Canu_res/'

### O11 NextDenovo assembly extracted with differential coverage analysis (DCA)
#flye --nano-raw ${RESULT_ndn}04_extract_putative_Y/extracted_putative_Y_nanopore_reads.fasta \
#-o ${RESULT_ndn}05_assemblies/flye_assembler_nanopore \
#-t 8 --resume

### O11 Canu assembly extracted with DCA
#flye --nano-raw ${RESULT_canu}04_extract_putative_Y/extracted_putative_Y_nanopore_reads_Canu_nosecondary.fasta \
#-o ${RESULT_canu}05_assemblies/flye_assembler_nanopore_Canu_nosecondary \
#-t 8

### O11 Canu assembly filt mix 0 extracted with DCA
#flye --nano-raw ${RESULT_canu}04_extract_putative_Y/extracted_putative_Y_nanopore_reads_Canu_nosecondary_filt_mix_0.fasta \
#-o ${RESULT_canu}05_assemblies/flye_assembler_nanopore_Canu_nosecondary_filt_mix_0 \
#-t 8

### O11 Canu assembly filt mix 0 extracted with DCA + gene fishing hit contigs
flye --nano-raw ${RESULT_canu}04_extract_putative_Y/extracted_putative_Y_nanopore_reads_Canu_nosecondary_filt_mix_0+GF.fasta \
-o ${RESULT_canu}05_assemblies/flye_assembler_nanopore_Canu_nosecondary_filt_mix_0+GF \
-t 8
