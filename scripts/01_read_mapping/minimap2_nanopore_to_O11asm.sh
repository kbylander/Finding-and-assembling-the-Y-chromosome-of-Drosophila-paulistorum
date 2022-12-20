#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 2
#SBATCH -t 2-00:00:00
#SBATCH -J long_map
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/191222__map_long_canu
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/191222_map_long_canu
#SBATCH --mail-user jay.hakansson.4449@student.uu.se
#SBATCH --mail-type=FAIL,END

module load bioinfo-tools

O11=/proj/sllstore2017063/y_chromosome/rawdata/O11_data/O11.fasta

reads=/proj/sllstore2017063/y_chromosome/rawdata/O11_data/nanopore_data/O11_nanopore.fastq
outdir=/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/01_read_mapping/
O11_CANU=/proj/sllstore2017063/y_chromosome/rawdata/O11_data/O11_Canu_contigs.fasta
OUTDIR_CANU=/proj/sllstore2017063/y_chromosome/nobackup/results/O11_Canu_res/01_read_mapping/

module load bioinfo-tools minimap2 samtools

#cd $outdir

#minimap2 -x map-ont -d O11_long_index.mmi $O11					#create index for long reads
#minimap2 -ax map-ont O11_long_index.mmi $reads | samtools view -h -o O11_nanopore_aln.bam	# alignment for Oxford Nanopore reads

cd $OUTDIR_CANU

#minimap2 -x map-ont -d O11_long_index.mmi $O11_CANU                   
minimap2 -ax map-ont O11_long_index.mmi $reads | samtools view -@ 2 -b | samtools sort -o sorted_${NAME}.bam
