#!/bin/bash

path="/home/ekvall/Desktop/new_output"
count=0
for i in $(find $path -name '*.pepXML'); do # Not recommended, will break on whitespace
  echo $count
  echo "$i"
  outPath="$path/crux_$count"
  crux psm-convert --input-format pepxml --output-dir $outPath $i pin 
  python deocyLabels.py --input "$outPath/psm-convert.pin" --output "$outPath/psm-convert_m.pin"
  percolator -X "$outPath/pout.xml" "$outPath/psm-convert_m.pin" >"$outPath/test.psms"
  (( count++ ))
done
