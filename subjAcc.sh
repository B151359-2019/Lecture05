#!/bin/sh
#Script filtering blast output data subject accession
#set variables and cleanup
unset IFS
IFS=$'\t'
fnr=0
fname="blastoutput2.out"
outFile="subjectAccessions.details"
rm -f $outFile

#write file header
echo -e "Subject Accessions for $fname:\n" > $outFile

#loop through input file and enumerate and extract subject accession if not an empty field
while read queryAcc subjAcc percentId alignLen mismatch gap qStart qEnd sStart sEnd eValue bitScore; do 
  if !(test -z $subjAcc); then 
    fnr=$((fnr+1)) 
    echo -e "$fnr\t$subjAcc" >> $outFile
  fi
done < $fname


