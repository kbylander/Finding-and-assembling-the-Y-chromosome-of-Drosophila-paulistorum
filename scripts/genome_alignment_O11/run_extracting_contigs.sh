#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 2
#SBATCH -t 00:10:00
#SBATCH -J extract_contigs_O11
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/extract_contigs_O11
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/extract_contigs_O11
#SBATCH --mail-user kalle.99@live.com
#SBATCH --mail-type=FAIL,END

SUB="/proj/sllstore2017063/y_chromosome/rawdata/O11_data/O11.fasta"
CONTIGS="/crex/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/02_read_depth/putative_contigs.csv"
RES_DIR="/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/genome_alignment_O11"

module load bioinfo-tools python

python extracting_contigs.py $CONTIGS $SUB ${RES_DIR}/Y_put_contigs_O11.fasta
