#!/bin/bash

# finds lines with unicode characters, likely for use with replace-unicode-characters.sh

while read line; do
  echo $line | grep "À\|Á\|Â\|Ã\|Ä\|Å\|Æ\|Ç\|È\|É\|Ê\|Ë\|Ì\|Í\|Î\|Ï\|Ð\|Ñ\|Ò\|Ó\|Ô\|Õ\|Ö\|Ø\|Ù\|Ú\|Û\|Ü\|Ý\|Þ\|ß\|à\|á\|â\|ã\|ä\|å\|æ\|ç\|è\|é\|ê\|ë\|ì\|í\|î\|ï\|ð\|ñ\|ò\|ó\|ô\|õ\|ö\|ø\|ù\|ú\|û\|ü\|ý\|þ\|ÿ\|Ă\|ă\|Ń\|ń\|Š\|š\|Ž\|ž\|ƒ\|Ș\|ș\|Ț\|ț\|¨\|“\|”"
done;
