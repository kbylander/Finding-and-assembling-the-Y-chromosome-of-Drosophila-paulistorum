#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 1
#SBATCH -t 01:00:00
#SBATCH -J extract_putative_Y_O11_illumina
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/extract_putative_Y_O11_illumina
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/extract_putative_Y_O11_illumina
#SBATCH --mail-user ellen.siggstedt.1185@student.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools samtools/1.14

RESULT='/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/'
ILLUMINA='/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/01_read_mapping/sorted_O11_Sample_TL-2788-O11*'

#Extract reads that are paired-end, and not the ones that are unmapped or the other read in the pair is unmapped
for i in ${ILLUMINA}
do
    NAME=$(basename -s .bam.bam $i)
    samtools view -@24 -f 1 -F 12 -L ${RESULT}02_read_depth/putative_contigs.csv \
    -b ${i} | \
    samtools fasta - > ${RESULT}04_extract_putative_Y/${NAME}.fasta
done
