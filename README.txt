
############################################################################################
############################################################################################
#### Copyright (c) 2017, Broad Institute
#### Redistribution and use in source and binary forms, with or
without
#### modification, are permitted provided that the following
conditions are
#### met:

####     Redistributions of source code must retain the above
         copyright
####     notice, this list of conditions and the following disclaimer.

####     Redistributions in binary form must reproduce the above
         copyright
####     notice, this list of conditions and the following disclaimer
         in
####     the documentation and/or other materials provided with the
####     distribution.

####     Neither the name of the Broad Institute nor the names of its
####     contributors may be used to endorse or promote products
####     derived
####     from this software without specific prior written permission.

#### THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
     CONTRIBUTORS
#### "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
#### LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
     FOR
#### A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
     COPYRIGHT
#### HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
     INCIDENTAL,
#### SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
#### LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
     USE,
#### DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
     ANY
#### THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
     TORT
#### (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
     USE
#### OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
     DAMAGE.
############################################################################################
############################################################################################

######################################################################################################
####### MSMuTect - Calling somatic MS indels
######################################################################################################
####### For details on the implementation 
####### see YE  Maruvka, Mouw K,  et al, Analysis of somatic
microsatellite indels identifies driver events in human tumors 
####### Nat. Biotechnology (2017) DOI: *****
#
# Written by Yosef E. Maruvka and Gad Getz
#
#############################################





It needs the following tools:
1. Bedtools
2. Samtools
3. Bowtie2
4. R 2.15.3 (or similar but bot R 3.)
5. Python-2.7 .
6. PHOBOS. It should be obtained from
http://www.ruhr-uni-bochum.de/ecoevo/cm/cm_phobos.htm and be placed
under the bin/ folder.

The command needed to be run from the MSMuTect directory (the needed
tools are in bin/ folder and the data is in reference/ folder)

MSMuTect has two step:

1. Allele calling per sample 

sh bin/shell_for_all.sh sample_ID BAM_file_PATH BAM_file_ID 

e.g.:
sh bin/shell_for_all.sh Normal data/ Normal.bam 
sh bin/shell_for_all.sh Tumor  data/ Tumor.bam 


2. MS_indel calling (per pair)

sh bin/ms_indel_calling.sh 

This step needs a file (space delimited, called Pairs2.ls in the
MSMuTect folder) that specifies the pairs for calling mutations. 
E.g.
Tumor Normal

The output MS indels will be under the Tumor folder (e.g. Tumor).
The format is a tab delimited maf_like file for every motif.

The "Decision" column for every candidat indel is:

1  - passed the threshold 
0  - did not pass the threshold
-1 - filtered due to the normal sample have two alleles with one
having a to low fraction
-2 - filtered due to the normal sample have more than two alleles
-3 - filtered due to not passing the KS-test

The current reference loci are on hg19 and includes the exome territory
only.


For comments suggstions or errors please contact
maruvka@broadinstitute.org 

