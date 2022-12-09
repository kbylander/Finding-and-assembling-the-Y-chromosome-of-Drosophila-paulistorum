#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 1
#SBATCH -t 00:05:00 
#SBATCH -J polish_flye_assembly
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/polish_flye_assembly
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/polish_flye_assembly
#SBATCH --mail-user ellen.siggstedt.1185@student.uu.se
#SBATCH --mail-type=FAIL,END

module load bioinfo-tools Pilon/1.24

RESULT='/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/'

java -jar $PILON_HOME/pilon.jar --genome ${RESULT}05_assembly/flye_assembler_nanopore/assembly.fasta \
--frags ${RESULT}05_assemblies/XXXXXX \
--threads 2 \
--outdir ${RESULT}05_assemblies/ --output polished_flye_assembly
