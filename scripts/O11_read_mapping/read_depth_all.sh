#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 6
#SBATCH -t 05:00:00
#SBATCH -J depth_all
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/161122_read_coverage
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/161122_read_coverage
#SBATCH --mail-user jay.hakansson.4449@student.uu.se
#SBATCH --mail-type=FAIL,END

module load bioinfo-tools samtools

RESULT=/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/01_read_mapping/

cd $RESULT
#note H adds a comment line. Not sure if it will work with the frame_depth_new.pl script
# UNMAP, SECONDARY, QCFAIL, or DUP are skipped, meaning we only compare uniquely mapped reads

samtools depth -f sorted_illumina.txt -H -o read_depth_all_illumina.out

samtools depth sorted_O11_nanopore_aln.bam.bam -o read_depth_nanopore.out
