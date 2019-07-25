#!/bin/bash

# Makes copies of lines containing special-characters and whitespace, with them replaced or removed, in place to preserve ordering

FILE=$1
cat $1 | while read line; do
  (echo $line; echo $line | sed 's/À/A/g' | sed 's/Á/A/g' | sed 's/Â/A/g' | sed 's/Ã/A/g' | sed 's/Ä/A/g' | sed 's/Å/A/g' | sed 's/Æ/A/g' | sed 's/Ç/C/g' | sed 's/È/E/g' | sed 's/É/E/g' | sed 's/Ê/E/g' | sed 's/Ë/E/g' | sed 's/Ì/I/g' | sed 's/Í/I/g' | sed 's/Î/I/g' | sed 's/Ï/I/g' | sed 's/Ð/D/g' | sed 's/Ñ/N/g' | sed 's/Ò/O/g' | sed 's/Ó/O/g' | sed 's/Ô/O/g' | sed 's/Õ/O/g' | sed 's/Ö/O/g' | sed 's/Ø/O/g' | sed 's/Ù/U/g' | sed 's/Ú/U/g' | sed 's/Û/U/g' | sed 's/Ü/U/g' | sed 's/Ý/Y/g' | sed 's/Þ/B/g' | sed 's/ß/S/g' | sed 's/à/a/g' | sed 's/á/a/g' | sed 's/â/a/g' | sed 's/ã/a/g' | sed 's/ä/a/g' | sed 's/å/a/g' | sed 's/æ/a/g' | sed 's/ç/c/g' | sed 's/è/e/g' | sed 's/é/e/g' | sed 's/ê/e/g' | sed 's/ë/e/g' | sed 's/ì/i/g' | sed 's/í/i/g' | sed 's/î/i/g' | sed 's/ï/i/g' | sed 's/ð/o/g' | sed 's/ñ/n/g' | sed 's/ò/o/g' | sed 's/ó/o/g' | sed 's/ô/o/g' | sed 's/õ/o/g' | sed 's/ö/o/g' | sed 's/ø/o/g' | sed 's/ù/u/g' | sed 's/ú/u/g' | sed 's/û/u/g' | sed 's/ü/u/g' | sed 's/ý/y/g' | sed 's/þ/b/g' | sed 's/ÿ/y/g' | sed 's/Ă/A/g' | sed 's/ă/a/g' | sed 's/Ń/N/g' | sed 's/ń/n/g' | sed 's/Š/S/g' | sed 's/š/s/g' | sed 's/Ž/Z/g' | sed 's/ž/z/g' | sed 's/ƒ/f/g' | sed 's/Ș/S/g' | sed 's/ș/s/g' | sed 's/Ț/T/g' | sed 's/ț/t/g' | sed 's/[[:punct:]]//g' | sed 's/ //g') | uniq
done
