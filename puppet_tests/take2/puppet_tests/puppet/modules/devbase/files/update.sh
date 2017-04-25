#!/usr/bin/env bash
find . -type d -name ".git" -printf "%P\n" | grep -v BKUP | rev | cut -d '/' -f2- | rev > tmp
while read LINE; do
	pushd $LINE
	git pull
	popd
done < tmp
rm tmp
