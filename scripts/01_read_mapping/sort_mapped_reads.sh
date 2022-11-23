#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 4
#SBATCH -t 2-00:00:00
#SBATCH -J read_sort
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/161122_sort_read_map
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/161122_sort_read_map
#SBATCH --mail-user jay.hakansson.4449@student.uu.se
#SBATCH --mail-type=FAIL,END

module load bioinfo-tools samtools

O11=/proj/sllstore2017063/y_chromosome/rawdata/O11_data/
RESULTS=/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/01_read_mapping/

cd $RESULTS
MAPPED_READS="/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/01_read_mapping/*.bam"

#sort read map file
for i in $MAPPED_READS
do
	NAME=$(basename $i)
	samtools sort $i -T $RESULTS/temp-files -o sorted_${NAME}.bam
done
