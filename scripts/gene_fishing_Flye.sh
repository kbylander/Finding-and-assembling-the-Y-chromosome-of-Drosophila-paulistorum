#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 4
#SBATCH -t 00:05:00
#SBATCH -J gene_fishing_Flye
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/gene_fishing_Flye
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/gene_fishing_Flye
#SBATCH --mail-user ellen.siggstedt.1185@student.uu.se
#SBATCH --mail-type=ALL

# Script for gene fishing of Flye assembly

module load bioinfo-tools blast/2.12.0+

ASSEMBLY='/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/05_assemblies/flye_assembler_nanopore/assembly.fasta'
GENES='/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/gene_fishing/genes.fasta'
RESULT='/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/06_assembly_eval/'

#Creating a database of the Flye assembly
makeblastdb -dbtype nucl -in ${ASSEMBLY} -out ${RESULT}database_Flye
blastdbcmd -db ${RESULT}database_Flye -info

blastn -query ${GENES} -db ${RESULT}database_Flye -out ${RESULT}/gene_fishing_Flye_assembly_result.tsv -outfmt 6 -num_threads 4
