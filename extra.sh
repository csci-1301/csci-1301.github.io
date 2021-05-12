#!/bin/bash

# this is a script of extra build steps that were easier for me to write in bash than makefile

# ===========================
# Positional args: 
# $1 - build output directory
# $2 - pandoc HTML flags
# $3 - meta file
# ============================

DOCS_DIR=./docs
LECTURES_DIR=./lectures/*
PAGES_HEADER=templates/web/header_book.html
PAGES=pages

# convert all markdown files in docs to html
# if you get includes working you can populated that part of index dynamically 
files=($(find ${DOCS_DIR} -type f -name '*.md'))
for item in ${files[*]}
do
  filename="$(basename "$item" | sed 's/\(.*\)\..*/\1/')"
  pandoc $item -o $1/$filename.html $2;
done

# build a paged version book and its toc
temp_toc_file="___toc.md"
echo "" > $temp_toc_file
files=($(find ${LECTURES_DIR} -type f -name 'index.md'))
test -d $1/$PAGES || mkdir $1/$PAGES 
for item in ${files[*]}
do
  filename="$(basename "$(dirname "$item")")"
  title=$(head -n 1 $item)
  title=`echo ${title//"#"}`
  html_path=$PAGES/$filename.html
  pandoc $item -o $1/$html_path $2 -B $PAGES_HEADER -A $PAGES_HEADER --metadata title="$title";
  md_link="## [${title}](/$html_path)"
  echo "$md_link" >> $temp_toc_file
done

pandoc $temp_toc_file -f markdown -o $1/$PAGES/index.html ${2/"--toc"/""} --shift-heading-level-by=1 --metadata-file=$3
rm -rf $temp_toc_file

# TODO: write a script to zip lab files