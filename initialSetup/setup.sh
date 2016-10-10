#!/bin/bash
grep File: | sed 's/<code>//g;s/<\/code>//g;s/<li>//g;s/<\/li>//g;s/ //g;s/File:/touch fileStructure\//g' > files.sh && chmod u+x files.sh
echo '#!/bin/bash' > run.sh
mkdir fileStructure
./files.sh && chmod u+x fileStructure/*
find ./fileStructure -type f -empty -exec echo echo \''#!/bin/bash'\' \> '{}' \; >> run.sh && chmod u+x run.sh
./run.sh
rm files.sh run.sh
