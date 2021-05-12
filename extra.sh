#!/bin/bash

# this is a script of extra build steps that were easier for me to write in bash than makefile

# ===========================
# Positional args: 
# $1 - build output directory
# $2 - pandoc HTML flags
# ============================

DOCS_DIR=./docs

# convert all markdown files in docs to html
files=($(find ${DOCS_DIR} -type f -name '*.md'))
for item in ${files[*]}
do
  filename="$(basename "$item" | sed 's/\(.*\)\..*/\1/')"
  pandoc $item -o $1/$filename.html $2;
done

# TODO: write a script to zip lab files