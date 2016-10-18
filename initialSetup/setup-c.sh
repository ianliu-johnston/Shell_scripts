#!/bin/bash
echo '#!/bin/bash' > files.sh
mkdir fileStructure
grep File: | sed 's/<code>//g;s/<\/code>//g;s/<li>//g;s/<\/li>//g;s/ //g;s/File:/touch fileStructure\//g' > files.sh && chmod u+x files.sh
./files.sh && rm files.sh
find ./fileStructure -type f -name "*.c" -empty -exec cp template.c '{}' \; 
