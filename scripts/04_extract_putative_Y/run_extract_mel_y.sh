#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 1
#SBATCH -t 00:10:00 
#SBATCH -J extract_y_contigs_mel
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/extract_y_contigs_mel
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/extract_y_contigs_mel
#SBATCH --mail-user kalle.99@live.com
#SBATCH --mail-type=FAIL,END

module load bioinfo-tools python

DIR="/crex/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/genome_alignment_O11"
FASTA="/crex/proj/sllstore2017063/y_chromosome/rawdata/other_data/dmel_scaffold2_V5.fasta"

python extract_mel_y.py ${FASTA} ${DIR}/y_contigs_mel.fasta
