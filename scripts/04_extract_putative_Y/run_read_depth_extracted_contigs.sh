#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 1
#SBATCH -t 01:00:00
#SBATCH -J read_depth_extracted_Canu_contigs_mix_0
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/read_depth_extracted_Canu_contigs_mix_0
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/read_depth_extracted_Canu_contigs_mix_0
#SBATCH --mail-user ellen.siggstedt.1185@student.uu.se
#SBATCH --mail-type=ALL

#Script to run the script read_depth_extracted_contigs.py

module load python/3.10.8

RESULT_NDN='/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/'
RESULT_Canu='/proj/sllstore2017063/y_chromosome/nobackup/results/O11_Canu_res/'
SCRIPT='/proj/sllstore2017063/y_chromosome/Finding-and-assembling-the-Y-chromosome-of-Drosophila-paulistorum/scripts/'

#python ${SCRIPT}04_extract_putative_Y/read_depth_extracted_contigs.py ${RESULT_NDN}02_read_depth/read_depth_all_positions_nanopore.out \
#${RESULT_NDN}04_extract_putative_Y/putative_contigs.csv \
#${RESULT_NDN}04_extract_putative_Y/read_depth_extracted_contigs_nanopore.out

python ${SCRIPT}04_extract_putative_Y/read_depth_extracted_contigs.py ${RESULT_Canu}02_read_depth/read_depth_all_positions_nanopore.out \
${RESULT_Canu}04_extract_putative_Y/putative_contigs_filt_mix_0.csv \
${RESULT_Canu}04_extract_putative_Y/read_depth_extracted_contigs_nanopore_filt_mix_0.out
