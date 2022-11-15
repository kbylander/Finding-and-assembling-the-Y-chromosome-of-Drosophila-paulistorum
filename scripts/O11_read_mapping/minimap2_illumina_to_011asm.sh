#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 8
#SBATCH -t 5-00:00:00
#SBATCH -J short_map
#SBATCH --mail-user jay.hakansson.4449@student.uu.se
#SBATCH --mail-type=FAIL,END

O11=/proj/sllstore2017063/y_chromosome/rawdata/O11_data/O11.fasta
outdir=/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/01_read_mapping/

module load bioinfo-tools minimap2 samtools

#saw a 
cd $outdir
#assumes index file has been created and is in outdir
NAME=$(basename $1 _R1.fastq.gz)
minimap2 -ax sr O11_short_index.mmi $1 $2 | samtools view -h -o ${NAME}.bam
