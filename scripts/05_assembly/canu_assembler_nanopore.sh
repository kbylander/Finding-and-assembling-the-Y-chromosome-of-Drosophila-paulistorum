#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 24:00:00 
#SBATCH -J canu_assembler_nanopore
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/canu_assembler_nanopore
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/canu_assembler_nanopore

module load bioinfo-tools canu/2.0

RESULT='/proj/sllstore2017063/y_chromosome/nobackup/results'
OUTPUT_DIR='/crex/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/05_assemblies'

canu -p canu_assembly \
-d ${OUTPUT_DIR} \
genomeSize=30.0m -maxThreads=4 \
-nanopore ${RESULT}/D_paulistorum_O11_res/04_extract_putative_Y/extracted_putative_Y_nanopore_reads.fasta

