#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 2
#SBATCH -t 3-00:00:00
#SBATCH -J short_map_to_Y
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/12122022_bwa_to_flye #write slurm log name here
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/12122022_bwa_to_flye #write same slurm log name here
#SBATCH --mail-user jay.hakansson.4449@student.uu.se
#SBATCH --mail-type=FAIL,END

FLYE_ASM=/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/05_assemblies/flye_assembler_nanopore/assembly.fasta
outdir=/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/07_map_to_Y_asm

module load bioinfo-tools bwa samtools

cd $outdir

#create index
#bwa index $FLYE_ASM
#map reads
NAME=$(basename $1 _R1.fastq.gz)
bwa mem $FLYE_ASM $1 $2 | samtools view -@ 2 -b | samtools sort -o sorted_${NAME}.bam

#count alignments
samtools flagstat sorted_${NAME}.bam > stats_sorted_${NAME}.txt
