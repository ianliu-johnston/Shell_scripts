#!/bin/bash
htmlParse=example_day.html
targdir=$(grep Directory: htmlParse | cut -d \> -f 3 | cut -d \< -f1 | head -1)

mkdir targdir
cd targdir
touch $(grep File: htmlParse | cut -d \> -f 3 | cut -d \< -f1)
find . -type f -name "*.c" -empty -exec cp ../template '{}' \;
echo -e "#ifndef HEADER_H\n#define HEADER_H\n" >> header.h
grep Prototype: htmlParse | cut -d \> -f 3 | cut -d \< -f1 | tr -d ' ' >> header.h
echo -e "_putchar.c\n" >> header.h
echo "#endif" >> header.h
cp ../README.md .
ls -1 | grep "[0-9]-" | grep ".c" | sort -h >> README.md
cp ../.gitignore .
cp ../_putchar.c .
mkdir mains
ln -s ~/Betty/betty-doc.pl _betty-d
ln -s ~/Betty/betty-style.pl _betty-s
