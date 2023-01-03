#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 4
#SBATCH -t 01:00:00
#SBATCH -J contig_fishing_Canu_Flye_ass
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/contig_fishing_Canu_Flye_ass
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/contig_fishing_Canu_Flye_ass
#SBATCH --mail-user ellen.siggstedt.1185@student.uu.se
#SBATCH --mail-type=ALL

# Script for fishing for contigs with hits from gene fishing

module load bioinfo-tools blast/2.12.0+

RESULT='/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/gene_fishing/'
O11_nextdenovo='/proj/sllstore2017063/y_chromosome/rawdata/O11_data/O11.fasta'
CANU_CONTIGS_with_hits='/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/gene_fishing/contigs_with_hits_Canu.fasta'
FLYE_PUTATIVE_Y='/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/05_assemblies/flye_assembler_nanopore/assembly.fasta'

#Creating a database of the O11 assembly and running blastn

### Fishing for Canu contigs from gene fishing in O11 nextdenovo assembly
makeblastdb -dbtype nucl -in ${O11_nextdenovo} -out ${RESULT}database_assembly
blastdbcmd -db ${RESULT}database_assembly -info
blastn -query ${CANU_CONTIGS_with_hits} -db ${RESULT}database_assembly -out ${RESULT}contig_fishing_Canu.tsv -outfmt 6 -num_threads 4

### Fishing for Canu contigs from gene fishin in Flye assembly of putative Y
makeblastdb -dbtype nucl -in ${FLYE_PUTATIVE_Y} -out ${RESULT}database_Flye_putative
blastdbcmd -db ${RESULT}database_Flye_putative -info
blastn -query ${CANU_CONTIGS_with_hits} -db ${RESULT}database_Flye_putative -out ${RESULT}contig_fishing_Canu_in_Flye_ass.tsv -outfmt 6 -num_threads 4
