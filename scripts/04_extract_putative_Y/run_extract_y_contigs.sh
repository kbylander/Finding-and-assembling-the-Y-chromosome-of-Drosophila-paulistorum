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

DIR="/crex/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/genome_alignment_O11"
FASTA="/crex/proj/sllstore2017063/y_chromosome/D_willistoni_ref_genome/ncbi_dataset/data/GCF_018902025.1"

python extract_y_contigs.py ${FASTA}/*.fasta ${DIR}/unloc_wil_scaff.txt ${DIR}/y_contigs_wil.fasta
