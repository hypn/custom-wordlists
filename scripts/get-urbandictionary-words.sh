#!/bin/bash

# SEE scrape-urbandictionary.sh

LETTER=$1
PAGE=$2

OUTPUT=`curl -s https://www.urbandictionary.com/browse.php?character=$LETTER\&page=$PAGE`
echo $OUTPUT | sed 's/term=/\n/g' | grep '</li>' | awk -F'>' '{print $2}' | awk -F'<' '{print $1}' | ./decode-html-entities.sh
