#Script to assembly extracted Y reads using Flye assembler

#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core
#SBATCH -n 8
#SBATCH --mem 56GB
#SBATCH -t 06:00:00 
#SBATCH -J flye_assembler_nanopore
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/flye_assembler_nanopore
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/flye_assembler_nanopore
#SBATCH --mail-user ellen.siggstedt.1185@student.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools Flye/2.9.1

RESULT='/proj/sllstore2017063/y_chromosome/nobackup/results/'

flye --nano-raw ${RESULT}D_paulistorum_O11_res/04_extract_putative_Y/extracted_putative_Y_nanopore_reads.fasta \
-o ${RESULT}D_paulistorum_O11_res/05_assemblies/flye_assembler_nanopore \
-t 8 --resume
