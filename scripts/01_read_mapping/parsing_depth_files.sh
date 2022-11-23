#!/bin/bash -l
#SBATCH -A snic2022-22-721
#SBATCH -p core -n 6
#SBATCH -t 2-00:00:00
#SBATCH -J parse_depth
#SBATCH -o /proj/sllstore2017063/y_chromosome/nobackup/logs/171122_parse_depth
#SBATCH -e /proj/sllstore2017063/y_chromosome/nobackup/logs/171122_parse_depth
#SBATCH --mail-user jay.hakansson.4449@student.uu.se
#SBATCH --mail-type=FAIL,END


RESULT=/proj/sllstore2017063/y_chromosome/nobackup/results/D_paulistorum_O11_res/01_read_mapping/

cd $RESULT

#make sure script file is in result folder

perl frame_depth_new.pl read_depth_all_illumina_no_header.out
perl frame_depth_new.pl read_depth_nanopore.out
