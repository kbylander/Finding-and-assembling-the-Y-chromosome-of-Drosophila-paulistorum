#Script to run the script read_depth_extracted_contigs.py

#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 1
#SBATCH -t 01:00:00
#SBATCH -J read_depth_extracted_contigs
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/read_depth_extracted_contigs
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/read_depth_extracted_contigs
#SBATCH --mail-user ellen.siggstedt.1185@student.uu.se
#SBATCH --mail-type=ALL

module load python/3.10.8

RESULT='/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/'
SCRIPT='/proj/sllstore2017063/y_chromosome/Finding-and-assembling-the-Y-chromosome-of-Drosophila-paulistorum/scripts/'

python ${SCRIPT}04_extract_putative_Y/read_depth_extracted_contigs.py ${RESULT}02_read_depth/read_depth_all_positions_nanopore.out \
${RESULT}04_extract_putative_Y/putative_contigs.csv \
${RESULT}04_extract_putative_Y/read_depth_extracted_contigs_nanopore.out
