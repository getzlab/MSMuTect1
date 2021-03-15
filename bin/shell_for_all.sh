#!/bin/bash
#$ -cwd
#$ -N GeP9
#$ -o GeO9.txt
#$ -e GeE9.txt 


mkdir $1_2/
cd $1_2/
ls -l  $2/$3 > list_size
bamToFastq -i $2/$3 -fq  $1.fq
awk 'BEGIN{n=0;}{if(n==0){split($1,a,"@");print ">"a[2];}if(n==1){print $1};n=n+1;if(n==4){n=0;}}'  $1.fq >  $1.fa
ls -l   *.fq >> list_size
rm  $2.fq
../bin/phobos  $1.fa  $1.phobos --minScore 5 --minLength_b 6 --minUnitLen 1 --maxUnitLen 6 --flanking 150 --outputFormat 3 
ls -l   *.fa >> list_size

rm *.fa
##tail -n +30 $1.phobos | head -n -1 >  outphobos_file_t
awk  '{ if (length($15)>9&&length($16)>9&&NR>30	) {print ">"$1"aaa"length($15)"aaa"length($16)"_"$3"_"$4"_"$5"_"$6"_"int($7) "\n" $15 $16              > $13"_1.phobos"}}'  $1.phobos 
ls -l  *.phobos >> list_size
rm $2.phobos
ls -l *_1.phobos | awk '{split($9,a,"_");print a[1];}' > words_1.list
awk  '{system("bowtie2 --no-unal --no-hd --no-sq -f ../reference/"$1" "$1"_1.phobos -S "$1"_impure_5_100_fa.aln")}' words_1.list

#awk  '{system("bowtie2 --no-unal --no-hd --no-sq -f /cga/tcga-gsc/home/maruvka/CancerTypes/MS_code/MS_WGS/"$1" "$1"_1.phobos -S "$1"_impure_5_100_fa.aln")}' words_1.list



ls -l  *.phobos >> list_size
rm *.phobos
awk '{system("sh ../bin/Remove_dup_1000.sh "$1"_impure_5_100_fa.aln 100")}' words_1.list
ls -l  *.aln >> list_size
rm *.aln

awk '{ gsub("_", ", " );print $0 }' A_impure_5_100_fa.aln_NoDup.hist > A_impure_5_100_fa.aln_NoDup.hist.py2
sh ../bin/changing_py_files.sh A_impure_5_100_fa.aln_NoDup.hist.py
sh ../bin/shell_for_allels.sh A_impure_5_100_fa.aln_NoDup.hist.py  ../bin/P_A.csv  > A_impure_5_100_fa.aln_NoDup.hist.py.all

awk '{ gsub("_", ", " );print $0 }' AC_impure_5_100_fa.aln_NoDup.hist > AC_impure_5_100_fa.aln_NoDup.hist.py2
sh ../bin/changing_py_files.sh AC_impure_5_100_fa.aln_NoDup.hist.py
sh ../bin/shell_for_allels.sh AC_impure_5_100_fa.aln_NoDup.hist.py  ../bin/P_AC.csv  > AC_impure_5_100_fa.aln_NoDup.hist.py.all

awk '{ gsub("_", ", " );print $0 }' AG_impure_5_100_fa.aln_NoDup.hist > AG_impure_5_100_fa.aln_NoDup.hist.py2
sh ../bin/changing_py_files.sh AG_impure_5_100_fa.aln_NoDup.hist.py
sh ../bin/shell_for_allels.sh AG_impure_5_100_fa.aln_NoDup.hist.py  ../bin/P_AG.csv  > AG_impure_5_100_fa.aln_NoDup.hist.py.all

awk '{ gsub("_", ", " );print $0 }' C_impure_5_100_fa.aln_NoDup.hist > C_impure_5_100_fa.aln_NoDup.hist.py2
sh ../bin/changing_py_files.sh C_impure_5_100_fa.aln_NoDup.hist.py
sh ../bin/shell_for_allels.sh C_impure_5_100_fa.aln_NoDup.hist.py  ../bin/P_C.csv  > C_impure_5_100_fa.aln_NoDup.hist.py.all





