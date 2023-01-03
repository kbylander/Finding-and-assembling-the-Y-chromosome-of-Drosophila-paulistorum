#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 4
#SBATCH -t 01:00:00
#SBATCH -J gene_fishing_wil+mel_filt_mix_0
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/gene_fishing_wil+mel_filt_mix_0
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/gene_fishing_wil+mel_filt_mix_0
#SBATCH --mail-user ellen.siggstedt.1185@student.uu.se
#SBATCH --mail-type=ALL

# Script for gene fishing with the new list of 7 genes found in both D. willistoni and D. melanogaster

module load bioinfo-tools blast/2.12.0+

RESULT='/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/gene_fishing/'
RESULT_GF='/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/06b_assembly_eval+GF/'
RESULT_Canu='/proj/sllstore2017063/y_chromosome/nobackup/results/O11_Canu_res/gene_fishing/'

O11='/proj/sllstore2017063/y_chromosome/rawdata/O11_data/'
O11_Canu='/proj/sllstore2017063/y_chromosome/rawdata/O11_data/O11_Canu_contigs.fasta'
ASSEMBLY_30perc='/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/05_assemblies/flye_assembler_nanopore_30perc/assembly.fasta'
ASSEMBLY_Flye='/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/05_assemblies/flye_assembler_nanopore/assembly.fasta'
ASSEMBLY_GF='/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/05_assemblies/flye_assembler_nanopore+GF/assembly.fasta'
ASSEMBLY_Canu_Flye='/proj/sllstore2017063/y_chromosome/nobackup/results/O11_Canu_res/05_assemblies/flye_assembler_nanopore_Canu_nosecondary/assembly.fasta'
ASSEMBLY_filt_mix_0='/proj/sllstore2017063/y_chromosome/nobackup/results/O11_Canu_res/05_assemblies/flye_assembler_nanopore_Canu_nosecondary_filt_mix_0/assembly.fasta'
ASSEMBLY_filt_mix_0_GF='/proj/sllstore2017063/y_chromosome/nobackup/results/O11_Canu_res/05_assemblies/flye_assembler_nanopore_Canu_nosecondary_filt_mix_0+GF/assembly.fasta'

#Creating a database of the O11 assembly and running blastn

### Provided O11 assembly
#makeblastdb -dbtype nucl -in ${O11}/O11.fasta -out ${RESULT}database_assembly
#blastdbcmd -db ${RESULT}database_assembly -info
#blastn -query ${RESULT}Ygenes_Dwil_also_in_Dmel.fasta -db ${RESULT}database_assembly -out ${RESULT}gene_fishing_wil+mel_result.tsv -outfmt 6 -num_threads 4

### Flye assembly on putative Y NextDenovo contigs from differential coverage analysis
#makeblastdb -dbtype nucl -in ${ASSEMBLY_Flye} -out ${RESULT}database_Flye
#blastdbcmd -db ${RESULT}database_Flye -info
#blastn -query ${RESULT}Ygenes_Dwil_also_in_Dmel.fasta -db ${RESULT}database_Flye -out ${RESULT}gene_fishing_wil+mel_Flye_assembly_result.tsv -outfmt 6 -num_threads 4

### Flye assembly with gene fishing contigs
#makeblastdb -dbtype nucl -in ${ASSEMBLY_GF} -out ${RESULT_GF}database_Flye+GF
#blastdbcmd -db ${RESULT_GF}database_Flye+GF -info
#blastn -query ${RESULT}Ygenes_Dwil_also_in_Dmel.fasta -db ${RESULT_GF}database_Flye+GF -out ${RESULT_GF}gene_fishing_wil+mel_Flye_assembly_result+GF.tsv -outfmt 6 -num_threads 4

### Provided Canu assembly
#makeblastdb -dbtype nucl -in ${O11_Canu} -out ${RESULT_Canu}database_provided_Canu
#blastdbcmd -db ${RESULT_Canu}database_provided_Canu -info
#blastn -query ${RESULT_Canu}Ygenes_Dwil_also_in_Dmel.fasta -db ${RESULT_Canu}database_provided_Canu -out ${RESULT_Canu}gene_fishing_wil+mel.tsv -outfmt 6 -num_threads 4

### Flye assembly 30 perc
#makeblastdb -dbtype nucl -in ${ASSEMBLY_30perc} -out ${RESULT}database_assembly_30perc
#blastdbcmd -db ${RESULT}database_assembly_30perc -info
#blastn -query ${RESULT}Ygenes_Dwil_also_in_Dmel.fasta -db ${RESULT}database_assembly_30perc -out ${RESULT}gene_fishing_wil+mel_result_30perc.tsv -outfmt 6 -num_threads 4

### Flye assembly on putative Y Canu contigs from differential coverage analysis
#makeblastdb -dbtype nucl -in ${ASSEMBLY_Canu_Flye} -out ${RESULT_Canu}database_Canu_Flye
#blastdbcmd -db ${RESULT_Canu}database_Canu_Flye -info
#blastn -query ${RESULT}Ygenes_Dwil_also_in_Dmel.fasta -db ${RESULT_Canu}database_Canu_Flye -out ${RESULT_Canu}gene_fishing_wil+mel_Canu_Flye.tsv -outfmt 6 -num_threads 4

### Flye assembly on putative Y Canu contigs from differential coverage analysis filter mix 0
makeblastdb -dbtype nucl -in ${ASSEMBLY_filt_mix_0} -out ${RESULT_Canu}database_Canu_Flye_mix_0
blastdbcmd -db ${RESULT_Canu}database_Canu_Flye_mix_0 -info
blastn -query ${RESULT}Ygenes_Dwil_also_in_Dmel.fasta -db ${RESULT_Canu}database_Canu_Flye_mix_0 -out ${RESULT_Canu}gene_fishing_wil+mel_Canu_Flye_mix_0.tsv -outfmt 6 -num_threads 4

### Flye assembly on putative Y Canu contigs from differential coverage analysis filter mix 0 + gene fishing contigs
makeblastdb -dbtype nucl -in ${ASSEMBLY_filt_mix_0_GF} -out ${RESULT_Canu}database_Canu_Flye_mix_0_GF
blastdbcmd -db ${RESULT_Canu}database_Canu_Flye_mix_0_GF -info
blastn -query ${RESULT}Ygenes_Dwil_also_in_Dmel.fasta -db ${RESULT_Canu}database_Canu_Flye_mix_0_GF -out ${RESULT_Canu}gene_fishing_wil+mel_Canu_Flye_mix_0_GF.tsv -outfmt 6 -num_threads 4

