#!/bin/sh
sed -i \
         -e 's/#0e151e/rgb(0%,0%,0%)/g' \
         -e 's/#ede9e3/rgb(100%,100%,100%)/g' \
    -e 's/#0e151e/rgb(50%,0%,0%)/g' \
     -e 's/#9A7889/rgb(0%,50%,0%)/g' \
     -e 's/#0e151e/rgb(50%,0%,50%)/g' \
     -e 's/#ede9e3/rgb(0%,0%,50%)/g' \
	"$@"