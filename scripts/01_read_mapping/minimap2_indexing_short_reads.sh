#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 8
#SBATCH -t 01:00:00
#SBATCH -J index_short_reads
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/191222_index_short
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/191222_index_short
#SBATCH --mail-user jay.hakansson.4449@student.uu.se
#SBATCH --mail-type=FAIL,END

O11=/proj/sllstore2017063/y_chromosome/rawdata/O11_data/O11.fasta
O11_CANU=/proj/sllstore2017063/y_chromosome/rawdata/O11_data/O11_Canu_contigs.fasta
outdir=/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/01_read_mapping/
OUTDIR_CANU=/proj/sllstore2017063/y_chromosome/nobackup/results/O11_Canu_res/01_read_mapping/

module load bioinfo-tools minimap2

#cd $outdir
#create index for NextDenovo assembly:
#minimap2 -x sr -d O11_short_index.mmi $O11

cd $OUTDIR_CANU
minimap2 -x sr -d O11_short_index.mmi $O11_CANU
