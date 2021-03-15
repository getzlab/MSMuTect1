#####
# Making MSMuTect output a maf_like_file

# Inpuet 
# $1 = *.cln file. 


awk 'BEGIN{print ("Locus\tDecision\tNornal_histogram\tNormal_alleles\tNormal_frequencies\tTumor_histogram\tTumor_alleles\tTumor_frequencies")}{gsub("]",""); split($0,a,"[");print $2"\t"$1"\t"a[2]"\t"a[3]"\t"a[4]"\t"a[5]"\t"a[6]"\t"a[7] }' $1 > $1.maf_like
