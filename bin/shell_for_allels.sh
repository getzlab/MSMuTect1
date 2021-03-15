#!/bin/bash
#$ -cwd
#$ -N GeP9
#$ -o GeO9.txt
#$ -e GeE9.txt
python ../bin/Python_managing_file.py  $1 $2
