#!/bin/bash
# cat xml.txt \
cat enwiki-latest-pages-articles-multistream.xml \
	| rg -v '<base' \
	| rg -v '<case' \
	| rg -v '<comment' \
	| rg -v '<contributor' \
	| rg -v '<dbname' \
	| rg -v '<format' \
	| rg -v '<generator' \
	| rg -v '<id' \
	| rg -v '<ip' \
	| rg -v '<mediawiki' \
	| rg -v '<minor' \
	| rg -v '<model' \
	| rg -v '<namespace' \
	| rg -v '<namespaces' \
	| rg -v '<ns' \
	| rg -v '<page' \
	| rg -v '<parentid' \
	| rg -v '<redirect' \
	| rg -v '<revision' \
	| rg -v '<sha1' \
	| rg -v '<siteinfo' \
	| rg -v '<sitename' \
	| rg -v '<timestamp' \
	| rg -v '<title' \
	| rg -v '<username' \
	| rg -v '</base' \
	| rg -v '</case' \
	| rg -v '</comment' \
	| rg -v '</contributor' \
	| rg -v '</dbname' \
	| rg -v '</format' \
	| rg -v '</generator' \
	| rg -v '</id' \
	| rg -v '</ip' \
	| rg -v '</mediawiki' \
	| rg -v '</minor' \
	| rg -v '</model' \
	| rg -v '</namespace' \
	| rg -v '</namespaces' \
	| rg -v '</ns' \
	| rg -v '</page' \
	| rg -v '</parentid' \
	| rg -v '</redirect' \
	| rg -v '</revision' \
	| rg -v '</sha1' \
	| rg -v '</siteinfo' \
	| rg -v '</sitename' \
	| rg -v '</timestamp' \
	| rg -v '</title' \
	| rg -v '</username' \
  | sed 's/{{cite /{{/g' \
  | sed 's/{{/\n/g' \
  | sed 's/}}/\n/g' \
  | sed 's/\[\[/\n/g' \
  | sed 's/\]\]/\n/g' \
  | sed "s/'''/\n/g" \
  | sed "s/''/\n/g" \
  | sed 's/===/\n/g' \
  | sed 's/==/\n/g' \
  | sed 's/{|/\n/g' \
  | sed 's/|}/\n/g' \
  | sed 's/|/\n/g' \
  | sed 's/&gt;/\n/g' \
  | sed 's/&lt;/\n/g' \
  | sed 's/&amp;/\n/g' \
  | sed 's/&quot;/\n/g' \
  | sed 's/&nbsp;/\n/g' \
  | sed 's/<\/text>/\n/g' \
  | rg -v '^access-date=' \
  | rg -v '^archive-date=' \
  | rg -v '^archive-url=' \
  | rg -v '^author=' \
  | rg -v '^date=' \
  | rg -v '^first=' \
  | rg -v '^last=' \
  | rg -v '^magazine=' \
  | rg -v '^publisher=' \
  | rg -v '^r=' \
  | rg -v '^title=' \
  | rg -v '^url=' \
  | rg -v '^url-status=' \
  | rg -v '^website=' \
  | rg -v '^work=' \
  | rg -v '^.ref name=' \
  | rg -v '^agency=' \
  | rg -v '^first1=' \
  | rg -v '^format=' \
  | rg -v '^last1=' \
  | rg -v '^location=' \
  | rg -v '^! width=' \
  | rg -v '\- style=' \
  | rg -v '\- bgcolor' \
  | rg -v '^ rowspan=' \
  | rg -v '^ colspan=' \
  | rg -v '^rcat ' \
  | rg -v '^R ' \
  | rg -v '^File:' \
  | rg -v '^thumb' \
  | rg -v '^sfn' \
  | sed 's/ /\n/g' \
  | rg -v '^<text' \
  | rg -v '^bytes=' \
  | rg -v '^xml:space' \
  | rg -v '^[a-zA-Z0-9\-!_]{1,100}=[a-zA-Z0-9\-_ :;./ ,]{0,1000}' \
  | rg -v '^=$' \
  | rg -v '^=[0-9]{1,100}$' \
  | rg -v '^=\([0-9]{1,100}\)$' \
  | rg -v '^http' \
  | rg -v '^\[http' \
  | rg -v '^=http' \
  | rg -v '^*\[http' \
  | rg -v '^.ref\[' \
  | rg -v '^,ref\[' \
  | rg -v '^ref\[' \
  | rg -v '^!---' \
  | rg -v '^!--' \
  | rg -v '^!!' \
  | rg -v '^!' \
  | rg -v '^wikt:'\
  | sed 's/Category://g' \
  | sed 's/^(=$//g' \
  | sed 's/!--/\n/g' \
  | rg -v '^\\[a-z]{2,20}_\{' \
  | rg -v '/ref' \
  | rg -v '^\[#' \
  | rg -v '^\[...\]$' \
  | rg -v '^-\[' \
  | sed 's/\]br\[/\n/g' \
  | sed 's/nbsp;/\n/g' \
  | sed 's/\/nowiki/\n/g' \
  | rg -v '^/nowiki' \
  | rg -v '^\^nowiki' \
  | rg -v '^nowiki' \
  | rg -v '^wiki' \
  | rg -v '^wikibooks' \
  | rg -v '^wikiquote' \
  | rg -v '^wikiquote-inline' \
  | rg -v '^wikisource' \
  | rg -v '^wikispecies' \
  | rg -v '^wikitable' \
  | rg -v '^=wikitable' \
  | rg -v '^wikiversity' \
  | rg -v '^wikivoyage-inline' \
  | rg -v '^Image:' \
  | rg -v '^[a-zA-Z0-9\(\)\-_]{1,200}\.png$' \
  | rg -v '^[a-zA-Z0-9\(\)\-_]{1,200}\.jpg$' \
  | rg -v '^[a-zA-Z0-9\(\)\-_]{1,200}\.svg$' \
  | rg -v '^gt;$' \
  | rg -v '^lt;$' \
  | rg -v '^amp;$' \
  | rg -v '^quot;$' \
  | rg -v '^nbsp;$' \
  | rg -v '^gt$' \
  | rg -v '^lt$' \
  | rg -v '^amp$' \
  | rg -v '^quot$' \
  | rg -v '^nbsp$' \
  | rg -v '^#tag:ref' \
  | rg -v '^align:' \
  | rg -v '^background-color:' \
  | rg -v '^background:' \
  | rg -v '^canvas:' \
  | rg -v '^clear:' \
  | rg -v '^color:' \
  | rg -v '^dim:' \
  | rg -v '^display:inline-block' \
  | rg -v '^display:none' \
  | rg -v '^float:' \
  | rg -v '^font-family:' \
  | rg -v '^font-size:' \
  | rg -v '^font-weight:' \
  | rg -v '^gridcolor:' \
  | rg -v '^iarchive:' \
  | rg -v '^id:' \
  | rg -v '^margin-' \
  | rg -v '^margin:' \
  | rg -v '^orientation:' \
  | rg -v '^person:' \
  | rg -v '^region:' \
  | rg -v '^scale:' \
  | rg -v '^text-align:' \
  | rg -v '^text-indent:' \
  | rg -v '^textcolor:' \
  | rg -v '^type:' \
  | rg -v '^value:' \
  | rg -v '^vertical-align:' \
  | rg -v '^white-space:' \
  | rg -v '^width:' \
  | rg -v '^wiktionary:' \
  | sed 's/(/\n/g' \
  | sed 's/)/\n/g'
