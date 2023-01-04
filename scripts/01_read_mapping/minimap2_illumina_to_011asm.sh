#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 8
#SBATCH -t 5-00:00:00
#SBATCH -J short_map
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/191222__map_short_canu
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/191222_map_short_canu
#SBATCH --mail-user jay.hakansson.4449@student.uu.se
#SBATCH --mail-type=FAIL,END

#Author: Jay Håkansson
#Date: 2023-01-04

O11=/proj/sllstore2017063/y_chromosome/rawdata/O11_data/O11.fasta
outdir=/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/01_read_mapping/
O11_CANU=/proj/sllstore2017063/y_chromosome/rawdata/O11_data/O11_Canu_contigs.fasta
OUTDIR_CANU=/proj/sllstore2017063/y_chromosome/nobackup/results/O11_Canu_res/01_read_mapping/

module load bioinfo-tools minimap2 samtools

cd $outdir
#assumes index file has been created and is in outdir
NAME=$(basename $1 _R1.fastq.gz)
#minimap2 -ax sr O11_short_index.mmi $1 $2 | samtools view -h -o ${NAME}.bam

cd $OUTDIR_CANU
minimap2 -ax sr O11_short_index.mmi $1 $2 | samtools view -@ 2 -b | samtools sort -o sorted_${NAME}.bam
samtools flagstat sorted_${NAME}.bam > stats_sorted_${NAME}.txt
