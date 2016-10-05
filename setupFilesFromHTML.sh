grep File: example.html | sed -e 's/ //g;s/<[^>]*>//g;s/File:/touch /g;s/.$/.sh/g' > setup.sh && chmod u+x setup.sh
