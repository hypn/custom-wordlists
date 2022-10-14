#!/bin/bash

# eg: download link: https://archive.org/search.php?query=Wikimedia%20database%20dump%20of%20the%20Zulu%20Wiktionary%20on&and[]=year%3A%222022%22

FILE=$1

rg '<title>(.*)</title>' $FILE -r '$1' \
	| grep -v ':' \
	| grep -v '/' \
	| awk '{$1=$1};1' \
	| sed 's/”//g' \
	| sed 's/?//g' \
	| sort -u
