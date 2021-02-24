#!/bin/bash

path="/home/ekvall/Desktop/tutorial_percolater"
count=0
for pinFile in $(find $path -name '*.pin'); do # Not recommended, will break on whitespace
  echo $count
  echo "$pinFile"
  f="$(basename -- $pinFile)"
  filename="${f%.*}"
  echo $filename
  #outPath="$path/crux_$count"
  #crux psm-convert --input-format pepxml --output-dir $outPath $i pin 

  #modifiedPin="$path/${filename}_m.pin"
  #python deocyLabels.py --input "$pinFile" --output $modifiedPin
  #echo "$path/${filename}_m.pin"
  xmlOut="${path}/${filename}.xml"
  psmOut="${path}/${filename}.psms"
  percolator -X $xmlOut $pinFile > $psmOut
  (( count++ ))
done
