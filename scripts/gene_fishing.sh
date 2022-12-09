#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 4
#SBATCH -t 00:05:00
#SBATCH -J gene_fishing
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/gene_fishing
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/gene_fishing
#SBATCH --mail-user ellen.siggstedt.1185@student.uu.se
#SBATCH --mail-type=ALL

# Script for gene fishing

module load bioinfo-tools blast/2.12.0+

O11='/proj/sllstore2017063/y_chromosome/rawdata/O11_data/'
RESULT='/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/gene_fishing/'

#Creating a database of the O11 assembly
makeblastdb -dbtype nucl -in ${O11}/O11.fasta -out ${RESULT}database_assembly
blastdbcmd -db ${RESULT}database_assembly -info

blastn -query ${RESULT}genes.fasta -db ${RESULT}database_assembly -out ${RESULT}/gene_fishing_result.tsv -outfmt 6 -num_threads 4
