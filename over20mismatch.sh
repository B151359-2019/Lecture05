#!/bin/sh
#Script filtering blast output data for HSPs with over 20 mismatches
#set variables and cleanup
unset IFS
IFS=$'\t'
fnr=0
mismatchNum=20
fname="blastoutput2.out"
outFile="overTwentyMismatches.details"
rm -f $outFile

#write file header
echo -e "HSPs with over 20 mismatches from $fname:\n" > $outFile

#loop through input file and enumerate and extract subject accession if not an empty field
while read queryAcc subjAcc percentId alignLen mismatch gap qStart qEnd sStart sEnd eValue bitScore; do 
#  if test "$mismatch" -gt "$mismatchNum" ; then 
#    fnr=$((fnr+1)) 
#    echo -e "$fnr\t$queryAcc\t$subjAcc\t$percentId\t$alignLen\t$mismatch\t$gap\t$qStart\t$qEnd\t$sStart\t$sEnd\t$eValue\t$bitScore" >> $outFile
#  fi
     echo "$mismatch"
done < grep -v "^#" $fname


