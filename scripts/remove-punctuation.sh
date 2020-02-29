#!/bin/bash

# removes punctuation and unicode'y stuff, preserving spaces

while read line; do
  echo $line | sed 's/-/ /g' | sed 's/[[:punct:]]//g'
done;
