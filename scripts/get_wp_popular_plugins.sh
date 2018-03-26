#!/bin/bash
curl -s https://wordpress.org/plugins/browse/popular/ | grep "wordpress.org/plugins" | grep bookmark | grep "</a>" | awk -F/ '{print $5}';
seq 2 99 | while read line; do curl https://wordpress.org/plugins/browse/popular/page/$line/ -s | grep "wordpress.org/plugins" | grep bookmark | grep "</a>" | awk -F/ '{print $5}'; done
