#!/usr/bin/env bash
TMP_FILE=tmp$(date +%s)
find . -type d -name ".git" -printf "%P\n" | grep -v BKUP | rev | cut -d '/' -f2- | rev >  $TMP_FILE
while read LINE; do
	pushd $LINE
	git pull
	git submodule update --init --recursive
	popd
done < $TMP_FILE
rm $TMP_FILE
