#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 1
#SBATCH -t 00:30:00
#SBATCH -J summary_read_depth_filt_mix_0
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/summary_read_depth_filt_mix_0
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/summary_read_depth_filt_mix_0

#Script to run the summarize_read_depth_etracted_contigs.py

module load python/3.10.8

RESULT='/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/'
RESULT_Canu='/proj/sllstore2017063/y_chromosome/nobackup/results/O11_Canu_res/'
SCRIPT='/proj/sllstore2017063/y_chromosome/Finding-and-assembling-the-Y-chromosome-of-Drosophila-paulistorum/scripts/'

#python ${SCRIPT}04_extract_putative_Y/summarize_read_depth_extracted_contigs.py \
#${RESULT}04_extract_putative_Y/read_depth_extracted_contigs_nanopore.out \
#${RESULT}04_extract_putative_Y/putative_contigs.csv \
#${RESULT}04_extract_putative_Y/summary_read_depth_extracted_contigs_nanopore2.out

#python ${SCRIPT}04_extract_putative_Y/summarize_read_depth_extracted_contigs.py \
#${RESULT}07_map_to_Y_asm/read_depth_female_Flye_O11_OR_young.out \
#${RESULT}07_map_to_Y_asm/list_of_Flye_contigs.csv \
#${RESULT}07_map_to_Y_asm/summary_read_depth_female_Flye_OR_young.out

python ${SCRIPT}04_extract_putative_Y/summarize_read_depth_extracted_contigs.py \
${RESULT_Canu}04_extract_putative_Y/read_depth_extracted_contigs_nanopore_filt_mix_0.out \
${RESULT_Canu}04_extract_putative_Y/putative_contigs_filt_mix_0.csv \
${RESULT_Canu}04_extract_putative_Y/summary_read_depth_extracted_contigs_nanopore_filt_mix_0.out
