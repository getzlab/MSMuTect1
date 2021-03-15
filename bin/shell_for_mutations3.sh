#!/bin/bash
#$ -cwd
#$ -N GeP9
#$ -o GeO9.txt
#$ -e GeE9.txt
head -n $1 $2 | tail -n 1 | awk '{system($0)}'
