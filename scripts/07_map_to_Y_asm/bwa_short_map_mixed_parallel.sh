#!/bin/bash -l

R1_PAIRED="/proj/sllstore2017063/y_chromosome/rawdata/O11_data/short_read_data/O11_*R1.fastq.gz"
for i in $R1_PAIRED
do
	R2_PAIRED=${i/_R1.fastq.gz/_R2.fastq.gz}
        NAME=$(basename $i _R1.fastq.gz)
	sbatch /proj/sllstore2017063/y_chromosome/scripts_new/07_map_to_Y_asm/bwa_illumina_to_flyeYasm.sh ${i} ${R2_PAIRED}
done
