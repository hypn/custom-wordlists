#!/bin/bash
strings FIRST-PASS.TXT \
  | sed 's/\r/\n/g' \
  | sed 's/\t/\n/g' \
  | sed 's/^*/\n/g' \
  | sed 's/#/\n/g' \
  | sed 's/^,$/\n/g' \
  | sed 's/^\.$/\n/g' \
  | sed 's/^,/\n/g' \
  | sed 's/^\./\n/g' \
  | sed 's/,$/\n/g' \
  | sed 's/\.$/\n/g' \
  | sed 's/---$/\n/g' \
  | sed 's/--$/\n/g' \
  | sed 's/-$/\n/g' \
  | sed 's/\]$/\n/g' \
  | sed 's/^\[/\n/g' \
  | sed 's/\]//g' \
  | sed 's/\[//g' \
  | sed 's/:$/\n/g' \
  | sed 's/{/\n/g' \
  | sed 's/}/\n/g' \
  | sed 's/;/\n/g' \
  | sed 's/^=/\n/g' \
  | sed 's/\.$/\n/g' \
  | sed 's/\.\.\.$/\n/g' \
  | sed 's/^\.\.\./\n/g' \
  | sed 's/\.\.$/\n/g' \
  | sed 's/^\.\./\n/g' \
  | sed 's/\.$/\n/g' \
  | sed 's/^\./\n/g' \
  | sed 's/\.\.\./\n/g' \
  | sed 's/\.\./\n/g' \
  | sed 's/^:/\n/g' \
  | sed 's/^\\/\n/g' \
  | sed 's/^\-/\n/g' \
  | egrep -v '^http' \
  | egrep -v '/blockquote' \
  | egrep -v '/center' \
  | egrep -v '/div' \
  | egrep -v '/small' \
  | egrep -v '/span' \
  | egrep -v '/sub' \
  | egrep -v '/sup' \
  | egrep -v 'references/' \
  | egrep -v '^n/a$' \
  | egrep -v '^koilbbl/' \
  | egrep -v '^\\alpha' \
  | egrep -v '^\\bar' \
  | egrep -v '^\\begin' \
  | egrep -v '^\\ce' \
  | egrep -v '^\\end' \
  | egrep -v '^\\frac' \
  | egrep -v '^\\gamma' \
  | egrep -v '^\\math' \
  | egrep -v '^\\operator' \
  | egrep -v '^\\overset' \
  | egrep -v '^\\sigma' \
  | egrep -v '^\\sin' \
  | egrep -v '^\\sqrt' \
  | egrep -v '^\\theta' \
  | egrep -v '^\\mu_' \
  | egrep -v '^\\int' \
  | egrep -v '^\\phi' \
  | egrep -v '^\\textstyle' \
  | egrep -v '^\\sum_' \
  | egrep -v '^/hiero' \
  | egrep -v '^/imagemap' \
  | egrep -v '^/math' \
  | egrep -v '^/gallery' \
  | egrep -v '^/female' \
  | egrep -v '^/chem' \
  | egrep -v '^/poem' \
  | egrep -v '^/abbr' \
  | egrep -v '^/syntaxhighlight' \
  | egrep -v '^/big' \
  | egrep -v '^/code' \
  | egrep -v 'Template:' \
  | egrep -v '^Appendix:' \
  | egrep -v '^D10-HqA-M14-N35A-V9:' \
  | egrep -v '^DEFAULTSORT:' \
  | egrep -v '^DISPLAYTITLE:' \
  | egrep -v '^File:' \
  | egrep -v '^Note:' \
  | egrep -v '^Portal:' \
  | egrep -v '^Special:' \
  | egrep -v '^Talk:' \
  | egrep -v '^User:' \
  | egrep -v '^Wikijunior:' \
  | egrep -v '^Wikipedia:' \
  | egrep -v '^Wikt:' \
  | egrep -v '^Wiktionary:' \
  | egrep -v '^WP:' \
  | egrep -v '^Press:' \
  | egrep -v '^border:' \
  | egrep -v '^s:' \
  | egrep -v '^tr:' \
  | egrep -v '^adding-top' \
  | egrep -v '^bar:' \
  | egrep -v '^expr:' \
  | egrep -v '^file:' \
  | egrep -v '^formatnum:' \
  | egrep -v '^image:' \
  | egrep -v '^increment:' \
  | egrep -v '^label-offset-' \
  | egrep -v '^line-height:' \
  | egrep -v '^padding-bottom:' \
  | egrep -v '^padding:' \
  | egrep -v '^section:' \
  | egrep -v '^text:' \
  | egrep -v '^till:' \
  | egrep -v '^:' \
  | egrep -v '^-$' \
  | egrep -v '^--$' \
  | egrep -v '^---$' \
  | egrep -v '^\*$' \
  | egrep -v '^\*-$' \
  | egrep -v '^--$' \
  | egrep -v '^\*$' \
  | egrep -v '^:$' \
  | egrep -v '^:\*$' \
  | egrep -v '^\*\*$' \
  | egrep -v '^/$' \
  | egrep -v '^br/$' \
  | egrep -v '^$' \
  | egrep -v "^'s$" \
  | egrep -v "^\*$" \
  | egrep -v '^:\*' \
  | egrep -v '^::\*' \
  | egrep -v '^:::\*' \
  | egrep -v '^\*' \
  | egrep -v '^\*:' \
  | egrep -v '^\*\*' \
  | egrep -v '^\*\*\*' \
  | egrep -v '^\*\*\*\*' \
  | egrep -v '^\*\*\*\*\*' \
  | egrep -v '^\*\*\*\*\*\*' \
  | egrep -v '^\*\*\*\*\*\*\*' \
  | egrep -v '^\*\*\*\*\*\*\*\*' \
  | egrep -v '^\*\*\*\*\*\*\*\*\*' \
  | egrep -v '^\*\*\*\*\*\*\*\*\*\*' \
  | egrep -v '^\*\*\*\*\*\*\*\*\*\*\*' \
  | egrep -v '^\*\*\*\*\*\*\*\*\*\*\*\*' \
  | egrep -v '^\*\*\*\*\*\*\*\*\*\*\*\*\*' \
  | egrep -v '^\*\*\*\*\*\*\*\*\*\*\*\*\*\*' \
  | egrep -v '^\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*' \
  | egrep -v '^\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*' \
  | egrep -v '^[a-zA-Z0-9\.]{19}$' \
  | egrep -v '^[0-9]{7,32}$' \
  | egrep -v '^[0-9]{1,8}\.[0-9]{1,8}/' \
  | egrep -v '^[0-9]{1,8}\.[0-9]{1,8}$' \
  | egrep -v '^[0-9]{1,8},[0-9]{1,8}$' \
  | egrep -v '^-[0-9]{1,8},[0-9]{1,8}$' \
  | egrep -v '^-[0-9]{1,8}\.[0-9]{1,8}$' \
  | egrep -v "^$"
