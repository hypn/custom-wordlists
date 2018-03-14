#!/bin/bash
#
# Usage:
#   ./scripts/make-noun-plurals.sh | sort | uniq > nouns-plural.txt
#

# try "s" suffix
for LEN in `seq 24`
do
	NEW_LEN=$(($LEN+1))
	cat nouns-singular.txt | grep -x ".\{$LEN,$LEN\}" | xargs -n 1 -i grep "{}s$" /usr/share/dict/american-english | grep -v "'" | grep -x ".\{$NEW_LEN,$NEW_LEN\}"
done

# try "es" suffix
for LEN in `seq 24`
do
	NEW_LEN=$(($LEN+2))
	cat nouns-singular.txt | grep -x ".\{$LEN,$LEN\}" | xargs -n 1 -i grep "{}es$" /usr/share/dict/american-english | grep -v "'" | grep -x ".\{$NEW_LEN,$NEW_LEN\}"
done

# search for "city -> cities"
for LEN in `seq 24`
do
	NEW_LEN=$(($LEN+2))
	cat nouns-singular.txt | grep -x ".\{$LEN,$LEN\}" | grep "ty$" | sed 's/ty/ties/g' | xargs -n 1 -i grep "{}$" /usr/share/dict/american-english | grep -v "'" | grep -x ".\{$NEW_LEN,$NEW_LEN\}"
done

# search for "life -> lives"
for LEN in `seq 24`
do
	NEW_LEN=$(($LEN+3))
	cat nouns-singular.txt | grep -x ".\{$LEN,$LEN\}" | grep "f$" | sed 's/f/ves/g' | xargs -n 1 -i grep "{}$" /usr/share/dict/american-english | grep -v "'" | grep -x ".\{$NEW_LEN,$NEW_LEN\}"
done

# search for "staff -> staves"
for LEN in `seq 24`
do
	NEW_LEN=$(($LEN+1))
	cat nouns-singular.txt | grep -x ".\{$LEN,$LEN\}" | grep "ff$" | sed 's/ff/ves/g' | xargs -n 1 -i grep "{}$" /usr/share/dict/american-english | grep -v "'" | grep -x ".\{$NEW_LEN,$NEW_LEN\}"
done

