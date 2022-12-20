#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 2
#SBATCH -t 4-00:00:00
#SBATCH -J Y_spec_exonerate_gene_alignment
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/161222_exonerate_Y_spec_genes_best5 #write slurm log name here
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/161222_exonerate_Y_spec_genes_best5
#SBATCH --mail-user jay.hakansson.4449@student.uu.se
#SBATCH --mail-type=FAIL,END

ASSEMBLY=/proj/sllstore2017063/y_chromosome/rawdata/O11_data/O11.fasta
GENES=/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/gene_fishing/genes.fasta
RESULT=/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/03_exonerate_gene_fishing/
Y_ASSEMBLY=/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/05_assemblies/flye_assembler_nanopore/assembly.fasta
Y_SPEC_GENES=/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/03_exonerate_gene_fishing/Ygenes_Dwil_also_in_Dmel.fasta


module load bioinfo-tools exonerate

cd $RESULT

#model: local gapped alignment, equivalent to Smith-Waterman-Gotoh
#no filtering on alignment:
#exonerate --model affine:local --showquerygff yes --bestn 3 -Q dna -T dna -q $GENES -t $ASSEMBLY > genes_to_O11.txt

#exonerate --model affine:local --showquerygff yes --bestn 3 -Q dna -T dna -q $GENES -t $Y_ASSEMBLY > flye_Y_asm_gene_hits.txt

#filter on at least 25% of the maximum score to the query

#exonerate --model affine:local --percent 25 --bestn 3 -Q dna -T dna -q $GENES -t $ASSEMBLY > 25_percent_genes_to_O11.txt

#exonerate --model affine:local --percent 25 --bestn 3 -Q dna -T dna -q $GENES -t $Y_ASSEMBLY > 25_percent_flye_Y_asm_gene_hits.txt

#filter on at least 10% of max score

#exonerate --model affine:local --percent 10 --bestn 3 -Q dna -T dna -q $GENES -t $ASSEMBLY > 10_percent_genes_to_O11.txt

#exonerate --model affine:local --percent 10 --bestn 3 -Q dna -T dna -q $GENES -t $Y_ASSEMBLY > 10_percent_flye_Y_asm_gene_hits.txt

#alignment of (probably) Y-specific genes that exist in both willistoni and melanogaster
#exonerate --model affine:local --bestn 5 -Q dna -T dna -q $Y_SPEC_GENES -t $ASSEMBLY > Y_spec_genes_to_O11_best5.txt

#exonerate --model affine:local --bestn 5 -Q dna -T dna -q $Y_SPEC_GENES -t $Y_ASSEMBLY > Y_spec_genes_to_flye_Y_asm_best5.txt


#exonerate --model affine:local --percent 10 -Q dna -T dna -q $Y_SPEC_GENES -t $ASSEMBLY > Y_spec_genes_to_O11_10percent.txt

#exonerate --model affine:local --percent 10 -Q dna -T dna -q $Y_SPEC_GENES -t $Y_ASSEMBLY > Y_spec_genes_to_flye_Y_asm_10percent.txt


exonerate --model affine:local --percent 5 --bestn 1 -Q dna -T dna -q $Y_SPEC_GENES -t $ASSEMBLY > Y_spec_genes_to_O11_5percent.txt

exonerate --model affine:local --percent 5 --bestn 1 -Q dna -T dna -q $Y_SPEC_GENES -t $Y_ASSEMBLY > Y_spec_genes_to_flye_Y_asm_5percent.txt

