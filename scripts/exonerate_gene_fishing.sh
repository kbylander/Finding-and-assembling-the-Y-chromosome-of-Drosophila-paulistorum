#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 2
#SBATCH -t 4-00:00:00
#SBATCH -J exonerate_gene_alignment
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/011222_exonerate #write slurm log name here
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/011222_exonerate #write same slurm log name here
#SBATCH --mail-user jay.hakansson.4449@student.uu.se
#SBATCH --mail-type=FAIL,END

ASSEMBLY=/proj/sllstore2017063/y_chromosome/rawdata/O11_data/O11.fasta
GENES=/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/gene_fishing/genes.fasta
RESULT=/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/03_exonerate_gene_fishing/

module load bioinfo-tools exonerate

cd $RESULT

#model: local gapped alignment, equivalent to Smith-Waterman-Gotoh

exonerate --model affine:local --showquerygff yes --bestn 3 -Q dna -T dna -q $GENES -t $ASSEMBLY

