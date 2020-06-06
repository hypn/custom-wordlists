#!/bin/bash

# make sure we have somewhere to put our wordlists
mkdir -p downloaded

# from dnscan
URL="https://raw.githubusercontent.com/rbsec/dnscan/master/subdomains-10000.txt" && echo $URL && curl -s $URL | sort | uniq > ./downloaded/rbsec-subdomains-10000.txt;
URL="https://raw.githubusercontent.com/rbsec/dnscan/master/subdomains-uk-1000.txt" && echo $URL && curl -s $URL | sort | uniq > ./downloaded/rbsec-subdomains-uk-1000.txt;

# from recon-ng, fierce, theHarvester, Knockpy, aquatone, sublist3r, amass, massdns, fast-subdomain-scanner, cloud-buster
URL="https://raw.githubusercontent.com/shakenetwork/Recon-ng/master/data/hostnames.txt" && echo $URL && curl -s $URL | sort | uniq > ./downloaded/shakenetwork-hostnames.txt;
URL="https://raw.githubusercontent.com/davidpepper/fierce-domain-scanner/master/hosts.txt" && echo $URL && curl -s $URL | sort | uniq > ./downloaded/davidpepper-hosts.txt;
URL="https://raw.githubusercontent.com/laramies/theHarvester/master/wordlists/dns-names.txt" && echo $URL && curl -s $URL | sort | uniq > ./downloaded/laramies-dns-names.txt;
URL="https://raw.githubusercontent.com/santiko/KnockPy/master/wordlist.txt" && echo $URL && curl -s $URL | sort | uniq > ./downloaded/knock-wordlist.txt;
URL="https://raw.githubusercontent.com/michenriksen/aquatone/ruby/subdomains.lst" && echo $URL && curl -s $URL | sort | uniq > ./downloaded/aquatone-subdomains.txt;
URL="https://raw.githubusercontent.com/aboul3la/Sublist3r/master/subbrute/names.txt" && echo $URL && curl -s $URL | sort | uniq > ./downloaded/subbrute-subdomains.txt;
URL="https://raw.githubusercontent.com/OWASP/Amass/05a190ddeeaeb0730ee2a3d18e63c3bf9f62d049/examples/wordlists/subdomains-top1mil-5000.txt" && echo $URL && curl -s $URL | sort | uniq > ./downloaded/subbrute-subdomains.txt;
URL="https://raw.githubusercontent.com/blechschmidt/massdns/master/lists/names.txt" && echo $URL && curl -s $URL | sort | uniq > ./downloaded/massdns-subdomains.txt;
URL="https://raw.githubusercontent.com/ODSdev/fast-subdomain-scanner/master/wordlists/medium.txt" && echo $URL && curl -s $URL | sort | uniq > ./downloaded/fast-subdomain-scanner-subdomains.txt;
URL="https://raw.githubusercontent.com/SageHack/cloud-buster/master/lists/subdomains" && echo $URL && curl -s $URL | sort | uniq > ./downloaded/cloud-buster-subdomains.txt;

# others
URL="https://raw.githubusercontent.com/SageHack/cloud-buster/master/lists/subdomains" && echo $URL && curl -s $URL | sort | uniq > ./downloaded/SageHack-subdomains.txt;
URL="https://raw.githubusercontent.com/danTaler/WordLists/master/Subdomain.txt" && echo $URL && curl -s $URL | sort | uniq > ./downloaded/danTaler-Subdomain.txt;
URL="https://raw.githubusercontent.com/ODSdev/fast-subdomain-scanner/master/wordlists/big.txt" && echo $URL && curl -s $URL | sort | uniq > ./downloaded/ODSdev-big.txt;
URL="https://raw.githubusercontent.com/assetnote/commonspeak2-wordlists/master/subdomains/subdomains.txt" && echo $URL && curl -s $URL | sort | uniq > ./downloaded/assetnote-subdomains.txt;

# my custom wordlists \:D/ (double boosted to survive the last "grep -v" removing words appearing only once)
URL="https://raw.githubusercontent.com/hypn/custom-wordlists/master/dev-terms.txt" && echo $URL && curl -s $URL | sort | uniq > ./downloaded/hypn-dev-terms.txt;
URL="https://raw.githubusercontent.com/hypn/custom-wordlists/master/dev-terms.txt" && echo $URL && curl -s $URL | sort | uniq > ./downloaded/hypn-dev-terms2.txt;
URL="https://raw.githubusercontent.com/hypn/custom-wordlists/master/nouns-plural.txt" && echo $URL && curl -s $URL | sort | uniq > ./downloaded/nouns-plural.txt;
URL="https://raw.githubusercontent.com/hypn/custom-wordlists/master/nouns-plural.txt" && echo $URL && curl -s $URL | sort | uniq > ./downloaded/nouns-plural2.txt;
URL="https://raw.githubusercontent.com/hypn/custom-wordlists/master/nouns-singular.txt" && echo $URL && curl -s $URL | sort | uniq > ./downloaded/nouns-singular.txt;
URL="https://raw.githubusercontent.com/hypn/custom-wordlists/master/nouns-singular.txt" && echo $URL && curl -s $URL | sort | uniq > ./downloaded/nouns-singular2.txt;

# grab SecLists (note "SecLists/Discovery/DNS/sortedcombined-knock-dnsrecon-fierce-reconng.txt" will extra boost some of the above subdomains wordlists)
git clone https://github.com/danielmiessler/SecLists.git || (cd SecLists && git reset HEAD --hard && git pull)
rm SecLists/Discovery/DNS/sortedcombined-knock-dnsrecon-fierce-reconng.txt

# now merge them all and sort by most common, removing words seen only once
cat ./downloaded/*.txt ./SecLists/Discovery/DNS/*.txt | tr '[:upper:]' '[:lower:]' \
  | grep -v '\.' | grep -v ',' | grep -v '"' | grep -v '\$' | grep -v '\#' | grep -v '%' | grep -v '*' | grep -v '(' | grep -v ')' | grep -v '\-\-' | grep -v ' ' \
  | grep -v 'porn' | grep -v 'xxx' | grep -v 'lolita' | grep -v 'preteen' | grep -v 'naked' | grep -v 'nude' \
  | grep -v 'facebook' | grep -vE "^career" | grep -vE "^0x" | grep -vE "^free" | grep -vE "^blog[0-9a-z\-]{4,99}$" | grep -vE "^voipa0" \
  | grep -vE "^a[0-9]{3,99}" | grep -vE "^aa[0-9]{3,99}" | grep -vE "^web[0-9]{3,99}$" | grep -vE "^host[0-9]{3,99}$" | grep -vE "^host\-[0-9]{3,99}$" \
  | grep -vE '[0-9]{3}$' | grep -vE '^[0-9]{3,99}' | grep -vE '^[0-9]{1,3}-[0-9]{1,3}-' | grep -vE 'sub-[0-9]{1,3}-[0-9]{1,3}-[0-9]{1,3}' | grep -vE '^pc-86-' | grep -vE '^ew[0-9]{5}r' | grep -vE '^host-[0-9]{0,3}-'  \
  | grep -v 'shikuangzuqiu' | grep -v 'monclerjacket' | grep -v 'aomenduchang' | grep -v 'nikeair' | grep -v 'michaelkors' | grep -v '21k5m150' | grep -v 'zhenqian' | grep -v 'qipai' | grep -v 'wangshang' | grep -v 'yulechen' | grep -v 'taiyang' | grep -v 'baijial' | grep -v 'huanggu' | grep -v '2012ouz' | grep -v '2012nia' | grep -v '2013yul' | grep -v '2010shi' | grep -v 'range86-' | grep -v 'subnet-2' | grep -v '188jinba' | grep -v 'blocka-1' | grep -v 'a2c-net2' | grep -v 'station2' | grep -v 'celebrit' | grep -v ulberryayswa | grep -v 188jinbaobog | grep -v 188jinbaoboy | grep -v 007huangjiad | grep -v 2012shijiebe | grep -v 188jinbaobob | grep -v 366yulecheng | grep -v 2013zhuceson | grep -v 2012yulechen | grep -v 2008ouzhoube | grep -v pacquiao-vs- | grep -v lasrecetasde | grep -v 3axianjinqip | grep -v 3511838286pk | grep -v 2012aoyunhui | grep -v 12nianouzhou | grep -v 12boyulechen | grep -v 12betyuleche | grep -v narutoshippu | grep -v k-drama-nara | grep -v 2014shijiebe | grep -v 2013bocaizhu | grep -v 2012bocaikai | grep -v 188jinbaoboz | grep -v nod32-serial | grep -v gran-hermano | grep -v google-produ | grep -v esetnod32ser | grep -v emailmarketi | grep -v 365tiyutouzh | grep -v 365betbeiyon | grep -v 360dezhoupuk | grep -v 35118pk10145 | grep -v 2013qipaiyou | grep -v 2013nianliuh | grep -v 18huangbaoyu | grep -v 188zuqiubife | grep -v 188jinbaobox | grep -v 188betbeiyon | grep -v 1737qipaiyou | grep -v 163huangguan \
  | grep -vE '^sni' | grep -vE '^ssl' | grep -v '^xn--' \
  | sort | uniq -c | sort -nr \
  | grep -v "      1 " \
  | awk '{print $2}' \
  > ../subdomains.txt
