#!/bin/bash

# extracts just hyphen separate words (useful for splitting on when counting word occurrences)

while read line; do
	echo $line | rg -o "[a-zA-Z-]{1,100}-[a-zA-Z-]{1,100}"
done;
