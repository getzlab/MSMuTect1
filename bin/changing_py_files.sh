
##Input
# File name. e.g. :7B1_2/A_impure_5_100_fa.aln_NoDup.hist.py
awk '{gsub("  "," ");gsub(",","");gsub(" ",", ");print $0}' $12 >$1
