#!/bin/sh
#Script filtering blast output data for alignment length and percent ID
#set variables and cleanup
unset IFS
IFS=$'\t'
fnr=0
fname="blastoutput2.out"
outFile="alignLenPercID.details"
rm -f $outFile

#write file header
echo -e "Alignment length and Percent ID for $fname:\n" > $outFile

#loop through input file and enumerate and extract subject accession if not an empty field
while read queryAcc subjAcc percentId alignLen mismatch gap qStart qEnd sStart sEnd eValue bitScore; do 
  if !(test -z $alignLen); then 
    fnr=$((fnr+1)) 
    echo -e "$fnr\t$alignLen\t$percentId" >> $outFile
  fi
done < $fname


