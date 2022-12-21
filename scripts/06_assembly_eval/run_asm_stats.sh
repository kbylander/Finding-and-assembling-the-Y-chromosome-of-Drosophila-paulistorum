#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 1
#SBATCH -t 2:00:00
#SBATCH -J contig_stats
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/201222_contig_stats #write slurm log name here
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/201222_contig_stats #write same slurm log name here
#SBATCH --mail-user jay.hakansson.4449@student.uu.se
#SBATCH --mail-type=FAIL,END

Y_ASSEMBLY=/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/05_assemblies/flye_assembler_nanopore/assembly.fasta
RESULT=/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/06_assembly_eval
Y_CONTIGS=/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/genome_alignment_O11/y_contigs_O11.fasta
O11_ASSEMBLY=/proj/sllstore2017063/y_chromosome/rawdata/O11_data/O11.fasta

module load bioinfo-tools python3


#the provided O11 assembly here was done with NextDenovo
#python3 assembly_stats.py $Y_ASSEMBLY | python3 parse_asmstats.py > $RESULT/flye_y_assembly_stats.txt

#python3 assembly_stats.py $Y_CONTIGS | python3 parse_asmstats.py > $RESULT/y_contigs_stats.txt

#python3 assembly_stats.py $O11_ASSEMBLY | python3 parse_asmstats.py > $RESULT/O11_asm_stats.txt

#the provided O11 assembly hereafter was done with Canu
C_RESULT=/proj/sllstore2017063/y_chromosome/nobackup/results/O11_Canu_res/06_assembly_eval
C_O11_ASSEMBLY=/proj/sllstore2017063/y_chromosome/rawdata/O11_data/O11_Canu_contigs.fasta
C_Y_CONTIGS=/proj/sllstore2017063/y_chromosome/nobackup/results/O11_Canu_res/04_extract_putative_Y/extracted_putative_Y_nanopore_reads_Canu_nosecondary.fasta
C_Y_ASSEMBLY=/proj/sllstore2017063/y_chromosome/nobackup/results/O11_Canu_res/05_assemblies/flye_assembler_nanopore_Canu_nosecondary/assembly.fasta

#python3 assembly_stats.py $C_O11_ASSEMBLY | python3 parse_asmstats.py > $C_RESULT/O11_asm_stats.txt
python3 assembly_stats.py $C_Y_CONTIGS | python3 parse_asmstats.py > $C_RESULT/y_contigs_stats.txt
python3 assembly_stats.py $C_Y_ASSEMBLY | python3 parse_asmstats.py > $C_RESULT/flye_y_asm_stats.txt

