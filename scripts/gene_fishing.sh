#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 4
#SBATCH -t 00:05:00
#SBATCH -J gene_fishing
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/gene_fishing_o
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/gene_fishing_e
#SBATCH --mail-user ellen.siggstedt.1185@student.uu.se
#SBATCH --mail-type=BEGIN,FAIL,END

module load bioinfo-tools blast/2.12.0+

O11='/proj/sllstore2017063/y_chromosome/rawdata/O11_data/'
other='/proj/sllstore2017063/y_chromosome/rawdata/other_data/'
result='/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/gene_fishing/'

# makeblastdb -dbtype nucl -in genes.fasta -out ${result}database_genes
# blastdbcmd -db ${result}database_genes -info

blastn -query ${O11}/O11.fasta -db ${result}database_genes -out ${result}/gene_fishing_result.tsv -outfmt 6 -num_threads 4
