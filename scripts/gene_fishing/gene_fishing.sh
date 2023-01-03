#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 4
#SBATCH -t 40:00:00
#SBATCH -J gene_fishing_prot_Canu
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/gene_fishing_prot_Canu
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/gene_fishing_prot_Canu
#SBATCH --mail-user ellen.siggstedt.1185@student.uu.se
#SBATCH --mail-type=ALL

# Script for gene fishing with the first list of genes used

module load bioinfo-tools blast/2.12.0+

O11='/proj/sllstore2017063/y_chromosome/rawdata/O11_data/'
RESULT='/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/gene_fishing/'

ASSEMBLY='/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/05_assemblies/flye_assembler_nanopore/assembly.fasta'
GENES='/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/gene_fishing/genes.fasta'
RESULT_eval='/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/06_assembly_eval/'
CANU_RESULT='/proj/sllstore2017063/y_chromosome/nobackup/results/O11_Canu_res/gene_fishing/'
ASSEMBLY_CANU='/proj/sllstore2017063/y_chromosome/nobackup/results/O11_Canu_res/05_assemblies/flye_assembler_nanopore_Canu_nosecondary/assembly.fasta'

#Creating a database of the O11 assembly
## Provided O11 NextDenovo assembly
#makeblastdb -dbtype nucl -in ${O11}/O11.fasta -out ${RESULT}database_assembly
#blastdbcmd -db ${RESULT}database_assembly -info
#blastn -query ${RESULT}genes.fasta -db ${RESULT}database_assembly -out ${RESULT}/gene_fishing_result.tsv -outfmt 6 -num_threads 4
#tblastx -query ${RESULT}genes.fasta -db ${RESULT}database_assembly -query_gencode 1 -db_gencode 1 -out ${RESULT}/gene_fishing_result_prot.tsv -outfmt 6 -num_threads 4

## Putative Y from differential coverage analysis
#makeblastdb -dbtype nucl -in ${ASSEMBLY} -out ${RESULT_eval}database_Flye
#blastdbcmd -db ${RESULT_eval}database_Flye -info
#blastn -query ${GENES} -db ${RESULT_eval}database_Flye -out ${RESULT_eval}/gene_fishing_Flye_assembly_result.tsv -outfmt 6 -num_threads 4
#tblastx -query ${GENES} -db ${RESULT_eval}database_Flye -query_gencode 1 -db_gencode 1 -out ${RESULT_eval}/gene_fishing_Flye_assembly_result_prot.tsv -outfmt 6 -num_threads 4

## Provided Canu assembly
makeblastdb -dbtype nucl -in ${O11}/O11_Canu_contigs.fasta -out ${CANU_RESULT}database_ass_Canu
blastdbcmd -db ${CANU_RESULT}database_ass_Canu -info
#blastn -query ${RESULT}genes.fasta -db ${CANU_RESULT}database_ass_Canu -out ${CANU_RESULT}/gene_fishing_Canu.tsv -outfmt 6 -num_threads 4
tblastx -query ${RESULT}genes.fasta -db ${CANU_RESULT}database_ass_Canu -query_gencode 1 -db_gencode 1 -out ${CANU_RESULT}/gene_fishing_prot_Canu.tsv -outfmt 6 -num_threads 4

## Putative Y from differential coverage analysis
makeblastdb -dbtype nucl -in ${ASSEMBLY_CANU} -out ${CANU_RESULT}database_ass_Canu_Flye
blastdbcmd -db ${CANU_RESULT}database_ass_Canu_Flye -info
#blastn -query ${RESULT}genes.fasta -db ${CANU_RESULT}database_ass_Canu_Flye -out ${CANU_RESULT}/gene_fishing_Canu_Flye.tsv -outfmt 6 -num_threads 4
tblastx -query ${RESULT}genes.fasta -db ${CANU_RESULT}database_ass_Canu_Flye -query_gencode 1 -db_gencode 1 -out ${CANU_RESULT}/gene_fishing_prot_Canu_Flye.tsv -outfmt 6 -num_threads 4
