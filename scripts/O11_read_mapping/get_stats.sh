#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 2
#SBATCH -t 04:00:00
#SBATCH -J map_stats
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/161122_sort_read_map
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/161122_sort_read_map
#SBATCH --mail-user name.lastname@student.uu.se
#SBATCH --mail-type=FAIL,END

module load bioinfo-tools samtools

O11=/proj/sllstore2017063/y_chromosome/rawdata/O11_data/
RESULTS=/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/01_read_mapping/

cd $RESULTS
MAPPED_SAMPLES="/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/01_read_mapping/*.bam"

for i in $MAPPED_SAMPLES
do
	NAME=$(basename $i .bam)
	samtools flagstats $i > stats_${NAME}.txt
done

