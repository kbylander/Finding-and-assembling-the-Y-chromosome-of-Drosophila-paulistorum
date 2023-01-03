#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 1
#SBATCH -t 04:00:00 
#SBATCH -J extract_y_contigs_wil
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/extract_y_contigs_wil
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/extract_y_contigs_wil
#SBATCH --mail-user kalle.99@live.com
#SBATCH --mail-type=FAIL,END

module load bioinfo-tools python

#DIR="/crex/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/genome_alignment_O11"
DIR="/proj/sllstore2017063/y_chromosome/nobackup/results/O11_Canu_res/04_extract_putative_Y"
#FASTA="/crex/proj/sllstore2017063/y_chromosome/rawdata/O11_data/O11.fasta"
FASTA="/crex/proj/sllstore2017063/y_chromosome/rawdata/O11_data/O11_Canu_contigs.fasta"
#CONTIGS="/crex/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/04_extract_putative_Y/putative_contigs_30percent.csv"
CONTIGS="/proj/sllstore2017063/y_chromosome/nobackup/results/O11_Canu_res/04_extract_putative_Y/putative_contigs.csv"

python extract_y_contigs.py ${FASTA} ${CONTIGS} ${DIR}/CANU-PY.fasta
