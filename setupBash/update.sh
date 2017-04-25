#!/bin/bash
## Recursively pulls all git repositories.
## Optionally takes 1 argument to ignorea directory
## Will extend functionality later
find . -type d -name ".git" -printf "%P\n" | grep -v $1 | rev | cut -d '/' -f2- | rev > tmp
while read LINE; do
	pushd $LINE
	git pull
	popd
done < tmp
rm tmp
