#!/bin/bash

# converts the likes of &amp; to &

while read line; do
  echo $line | sed 's/\&amp;/\&/g' | sed "s/\&apos;/'/g" | sed 's/\&gt;/>/g' | sed 's/\&lt;/</g' | sed 's/\&quot;/"/g'
done
