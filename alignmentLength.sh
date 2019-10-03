#!/bin/sh
#Script filtering blast output data for HSPs < 100 amino acids and over 20 mismatches
#set variables and cleanup
unset IFS
IFS=$'\t'
fnr=0
mismatchNum=20
fname="HSP.out"
outFile="overTwentyMismatches.details"
rm -f $outFile
#write file header
#loop through input file and enumerate and extract subject accession if not an empty field
while read queryAcc subjAcc percentId alignLen mismatch gap qStart qEnd sStart sEnd eValue bitScore; do 
  if test "$mismatch" -gt "$mismatchNum" && test $alignLen -lt 100 ; then 
  fnr=$((fnr+1))
    echo -e "$fnr\t$queryAcc\t$subjAcc\t$percentId\t$alignLen\t$mismatch\t$gap\t$qStart\t$qEnd\t$sStart\t$sEnd\t$eValue\t$bitScore"
  fi
done < $fname
