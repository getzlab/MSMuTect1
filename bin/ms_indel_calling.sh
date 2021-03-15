
#Converting to BED format
ls -l */A_*.all >all_A.ls
cat all_A.ls | awk '{system("awk \x27{split($1,a,\":\");print a[1]\"\\t\"a[2]\"\\t\"a[3]\"\\t\"$0}\x27 "$9" | grep -v type | grep chr | awk \x27{if ( NF > 3 ) {print $0}}\x27 | sort -k1 -nk2 > "$9".bed")}' 
ls -l */C_*.all >all_C.ls
cat all_C.ls | awk '{system("awk \x27{split($1,a,\":\");print a[1]\"\\t\"a[2]\"\\t\"a[3]\"\\t\"$0}\x27 "$9" | grep -v type | grep chr | awk \x27{if ( NF > 3 ) {print $0}}\x27 | sort -k1 -nk2 > "$9".bed")}' 
ls -l */AC_*.all >all_AC.ls
cat all_AC.ls | awk '{system("awk \x27{split($1,a,\":\");print a[1]\"\\t\"a[2]\"\\t\"a[3]\"\\t\"$0}\x27 "$9" | grep -v type | grep chr | awk \x27{if ( NF > 3 ) {print $0}}\x27 | sort -k1 -nk2 > "$9".bed")}' 
ls -l */AG_*.all >all_AG.ls
cat all_AG.ls | awk '{system("awk \x27{split($1,a,\":\");print a[1]\"\\t\"a[2]\"\\t\"a[3]\"\\t\"$0}\x27 "$9" | grep -v type | grep chr | awk \x27{if ( NF > 3 ) {print $0}}\x27 | sort -k1 -nk2 > "$9".bed")}' 


#Creating the pairs
#ls -l */A_*NoDup.hist | awk '{split($9,a,"-");print a[1]"-"a[2]"-"a[3]}' | sort | uniq --count | sort -n > patient_numer_of_Samples.ls
#ls -l */A_*NoDup.hist | awk '{split($9,a,"-"); print a[4];}' | sort | uniq --count
#ls -l */A_*NoDup.hist > A_hist.ls
#awk '{if ($1>1){system("grep "$2" C_hist.ls | awk \x27 BEGIN{n=0;}{n=n+1;split($9,a,\"\"); split(a[1],b,\"-\");if((b[4]==\"10A\")||(b[4]==\"10B\")||(b[4]==\"11A\")){Norm[a[1]]=a[1];}else{Tum[a[1]]=a[1]}}END{for(i in Tum){for(j in Norm){printf i\"\\t\"j  \"\\n\"}}}\x27")}}' patient_numer_of_Samples.ls > Pairs2.ls 
#ls -l */A_*NoDup.hist | awk '{split($9,b,"READ-");split($9,a,"-");if(length(a)==7){print a[4]}else{print a[6]}}' | sort | uniq --count 

#ls -l */A_*NoDup.hist | awk '{split($9,a,"-");if(length(a)==9){print a[1]"-"a[2]"-"a[3]"-"a[4]"-"a[5]}else{print a[1]"-"a[2]"-"a[3]}}' | sort | uniq --count | sort -n > patient_numer_of_Samples.ls
#awk '{if ($1>1){system("grep "$2" A_hist.ls | awk \x27 BEGIN{n=0;}{n=n+1;split($9,a,\"\"); split(a[1],b,\"-\");if(length(b)==7){ba=b[4]}else{ba=b[6]};if((ba==\"10A\")||(ba==\"10B\")||(ba==\"10C\")||(ba==\"10D\")||(ba==\"10E\")||(ba==\"10F\")||(ba==\"10G\")||(ba==\"11A\")||(ba==\"11B\")||(ba==\"11C\")||(ba==\"14A\")){Norm[a[1]]=a[1];}else{Tum[a[1]]=a[1]}}END{for(i in Tum){for(j in Norm){printf i\"\\t\"j  \"\\n\"}}}\x27")}}' patient_numer_of_Samples.ls > Pairs2.ls 




#Taking only parallel loci
cat Pairs2.ls | awk '{system("intersectBed -a "$1"_2/A_impure_5_100_fa.aln_NoDup.hist.py.all.bed  -b "$2"_2/A_impure_5_100_fa.aln_NoDup.hist.py.all.bed > "$1"_2/"$1"_"$2"_A_impure_5_100_fa.aln_NoDup.hist.py.all.bed.par");system("intersectBed -b "$1"_2/A_impure_5_100_fa.aln_NoDup.hist.py.all.bed  -a "$2"_2/A_impure_5_100_fa.aln_NoDup.hist.py.all.bed > "$2"_2/"$2"_"$1"_A_impure_5_100_fa.aln_NoDup.hist.py.all.bed.par");}' 
cat Pairs2.ls | awk '{system("intersectBed -a "$1"_2/C_impure_5_100_fa.aln_NoDup.hist.py.all.bed  -b "$2"_2/C_impure_5_100_fa.aln_NoDup.hist.py.all.bed > "$1"_2/"$1"_"$2"_C_impure_5_100_fa.aln_NoDup.hist.py.all.bed.par");system("intersectBed -b "$1"_2/C_impure_5_100_fa.aln_NoDup.hist.py.all.bed  -a "$2"_2/C_impure_5_100_fa.aln_NoDup.hist.py.all.bed > "$2"_2/"$2"_"$1"_C_impure_5_100_fa.aln_NoDup.hist.py.all.bed.par");}' 
cat Pairs2.ls | awk '{system("intersectBed -a "$1"_2/AC_impure_5_100_fa.aln_NoDup.hist.py.all.bed  -b "$2"_2/AC_impure_5_100_fa.aln_NoDup.hist.py.all.bed > "$1"_2/"$1"_"$2"_AC_impure_5_100_fa.aln_NoDup.hist.py.all.bed.par");system("intersectBed -b "$1"_2/AC_impure_5_100_fa.aln_NoDup.hist.py.all.bed  -a "$2"_2/AC_impure_5_100_fa.aln_NoDup.hist.py.all.bed > "$2"_2/"$2"_"$1"_AC_impure_5_100_fa.aln_NoDup.hist.py.all.bed.par");}' 
cat Pairs2.ls | awk '{system("intersectBed -a "$1"_2/AG_impure_5_100_fa.aln_NoDup.hist.py.all.bed  -b "$2"_2/AG_impure_5_100_fa.aln_NoDup.hist.py.all.bed > "$1"_2/"$1"_"$2"_AG_impure_5_100_fa.aln_NoDup.hist.py.all.bed.par");system("intersectBed -b "$1"_2/AG_impure_5_100_fa.aln_NoDup.hist.py.all.bed  -a "$2"_2/AG_impure_5_100_fa.aln_NoDup.hist.py.all.bed > "$2"_2/"$2"_"$1"_AG_impure_5_100_fa.aln_NoDup.hist.py.all.bed.par");}' 

#Converting back to regular format
ls -l */*_A_*.par | awk '{print $9}' > par_A.ls
cat par_A.ls | awk '{system("awk \x27{$1=\"\";$2=\"\";$3=\"\";print $0;}\x27 "$1" | awk \x27 BEGIN {FS= \" -999 \"}{if (NF>3){print $0}}\x27   | awk \x27{gsub ( \"     \",\" \" ) ; gsub ( \"   \",\" \" ) ; gsub ( \"  \",\" \" ) ; gsub(\" chr\",\"chr\"); print $0 ; }\x27 > "$1".reg")}' 

ls -l */*_C_*.par | awk '{print $9}' > par_C.ls
cat par_C.ls | awk '{system("awk \x27{$1=\"\";$2=\"\";$3=\"\";print $0;}\x27 "$1" | awk \x27 BEGIN {FS= \" -999 \"}{if (NF>3){print $0}}\x27   | awk \x27{gsub ( \"     \",\" \" ) ; gsub ( \"   \",\" \" ) ; gsub ( \"  \",\" \" ) ; gsub(\" chr\",\"chr\"); print $0 ; }\x27 > "$1".reg")}' 

ls -l */*_AC_*.par | awk '{print $9}' > par_AC.ls
cat par_AC.ls | awk '{system("awk \x27{$1=\"\";$2=\"\";$3=\"\";print $0;}\x27 "$1" | awk \x27 BEGIN {FS= \" -999 \"}{if (NF>3){print $0}}\x27   | awk \x27{gsub ( \"     \",\" \" ) ; gsub ( \"   \",\" \" ) ; gsub ( \"  \",\" \" ) ; gsub(\" chr\",\"chr\"); print $0 ; }\x27 > "$1".reg")}' 

ls -l */*_AG_*.par | awk '{print $9}' > par_AG.ls
cat par_AG.ls | awk '{system("awk \x27{$1=\"\";$2=\"\";$3=\"\";print $0;}\x27 "$1" | awk \x27 BEGIN {FS= \" -999 \"}{if (NF>3){print $0}}\x27   | awk \x27{gsub ( \"     \",\" \" ) ; gsub ( \"   \",\" \" ) ; gsub ( \"  \",\" \" ) ; gsub(\" chr\",\"chr\"); print $0 ; }\x27 > "$1".reg")}' 


#use .scipy-0.13.0-python-2.7.1-sqlite3-rtrees
#use Python-2.7



#cp ../Skin_Cutaneous_Melanoma/Find_mutations2.py /xchip/cga_home/maruvka/READ
#cp ../Skin_Cutaneous_Melanoma/shell_for_mutations2.sh /xchip/cga_home/maruvka/READ


cat Pairs2.ls | awk '{print("python bin/Find_mutations2.py " $2"_2/"$2"_"$1"_A_impure_5_100_fa.aln_NoDup.hist.py.all.bed.par.reg "$1"_2/"$1"_"$2"_A_impure_5_100_fa.aln_NoDup.hist.py.all.bed.par.reg bin/P_A.csv 8 0.3 0.031 > "$1"_2/"$1"_"$2"_A.mut")}' > Lines_mut_A.ls
cat Pairs2.ls | awk 'BEGIN{n=0;}{n=n+1;system("sh bin/shell_for_mutations3.sh "n" Lines_mut_A.ls\n")}' > tempA 

cat Pairs2.ls | awk '{print("python bin/Find_mutations2.py " $2"_2/"$2"_"$1"_C_impure_5_100_fa.aln_NoDup.hist.py.all.bed.par.reg "$1"_2/"$1"_"$2"_C_impure_5_100_fa.aln_NoDup.hist.py.all.bed.par.reg bin/P_C.csv 8 0.3 0.031 > "$1"_2/"$1"_"$2"_C.mut")}' > Lines_mut_C.ls
cat Pairs2.ls | awk 'BEGIN{n=0;}{n=n+1;system("sh bin/shell_for_mutations3.sh "n" Lines_mut_C.ls\n")}'  > tempC 

cat  Pairs2.ls | awk '{print("python bin/Find_mutations2.py " $2"_2/"$2"_"$1"_AC_impure_5_100_fa.aln_NoDup.hist.py.all.bed.par.reg "$1"_2/"$1"_"$2"_AC_impure_5_100_fa.aln_NoDup.hist.py.all.bed.par.reg bin/P_AC.csv 8 0.3 0.031 > "$1"_2/"$1"_"$2"_AC.mut")}' > Lines_mut_AC.ls
cat Pairs2.ls | awk 'BEGIN{n=0;}{n=n+1;system("sh bin/shell_for_mutations3.sh "n" Lines_mut_AC.ls\n")}' > tempAC 

cat Pairs2.ls | awk '{print("python bin/Find_mutations2.py " $2"_2/"$2"_"$1"_AG_impure_5_100_fa.aln_NoDup.hist.py.all.bed.par.reg "$1"_2/"$1"_"$2"_AG_impure_5_100_fa.aln_NoDup.hist.py.all.bed.par.reg bin/P_AG.csv 8 0.3 0.031 > "$1"_2/"$1"_"$2"_AG.mut")}' > Lines_mut_AG.ls
cat Pairs2.ls | awk 'BEGIN{n=0;}{n=n+1;system("sh bin/shell_for_mutations3.sh "n" Lines_mut_AG.ls\n")}'  > tempAG 


#Fixing the new lines problem.
ls -l */*.mut > mut.ls
cat mut.ls |  awk '{system("tr \x27\\n\x27 \x27 \x27 < "$9 "| awk \x27{gsub(\"@\",\"\\n\");print $0}\x27 > "$9".cln")  }'; 

cat mut.ls | awk '{system("sh bin/make_maf_like.sh "$9".cln")}'



