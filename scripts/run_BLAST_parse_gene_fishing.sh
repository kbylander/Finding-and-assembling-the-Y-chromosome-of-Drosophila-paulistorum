#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 1
#SBATCH -t 00:05:00 
#SBATCH -J run_BLAST_parser_gene_fishing
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/run_BLAST_parser_gene_fishing
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/run_BLAST_parser_gene_fishing

module load bioinfo-tools python/3.10.8

result='/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/gene_fishing/'
scripts='/proj/sllstore2017063/y_chromosome/scripts_new/'

# Run 1:
# python ${scripts}BLAST_parse.py -i ${result}gene_fishing_result.tsv -p 90 -a 200 -o ${result}parsed_gene_fishing_result.tsv

# Run 2:
# python ${scripts}BLAST_parse.py -i ${result}gene_fishing_result.tsv -p 80 -a 200 -o ${result}parsed_gene_fishing_result2.tsv

# Run 3:
python ${scripts}BLAST_parse.py -i ${result}gene_fishing_result.tsv -p 85 -a 200 -o ${result}parsed_gene_fishing_result3.tsv
