#!/bin/bash
grep File: Day005_0x03.html | sed 's/<code>//g;s/<\/code>//g;s/<li>//g;s/<\/li>//g;s/ //g;s/File:/touch /g' > files.sh && chmod u+x files.sh
./files.sh && chmod u+x *
