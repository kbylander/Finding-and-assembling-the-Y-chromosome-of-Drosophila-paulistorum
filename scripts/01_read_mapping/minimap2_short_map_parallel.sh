#!/bin/bash -l

outdir=/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/01_read_mapping/
cd $outdir

R1_PAIRED="/proj/sllstore2017063/y_chromosome/rawdata/O11_data/short_read_data/*R1*"
for i in $R1_PAIRED
do
	R2_PAIRED=${i/_R1.fastq.gz/_R2.fastq.gz}
        NAME=$(basename $i _R1.fastq.gz)
	sbatch /proj/sllstore2017063/y_chromosome/scripts/O11_read_mapping/minimap2_illumina_to_011asm.sh ${i} ${R2_PAIRED}
done
