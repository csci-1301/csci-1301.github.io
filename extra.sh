#!/bin/bash

# extra build steps

# ===========================
# Positional args: 
# $1 - build output directory
# $2 - pandoc HTML flags
# $3 - meta file
# $4 - docs dir path
# $5 - lectures dir path
# $6 - labs directory
# $6 - pages dir path
# $8 - page header
# ============================

# convert all markdown files in docs to html
files=($(find ${4} -type f -name '*.md'))
for item in ${files[*]}
do
  filename="$(basename "$item" | sed 's/\(.*\)\..*/\1/')"
  pandoc $item -o $1/$filename.html $2;
done

# # build a paged version book and its toc
# temp_toc_file="toc.md"
# echo "" > $temp_toc_file
# files=($(find ${5} -type f -name 'index.md'))
# test -d $1/$7 || mkdir $1/$7 
# for item in ${files[*]}
# do
#   filename="$(basename "$(dirname "$item")")"
#   title=$(head -n 1 $item)
#   title=`echo ${title//"#"}`
#   html_path=$7/$filename.html
#   pandoc $item -o $1/$html_path $2 -B $8 -A $8 --metadata-file=$3;
#   md_link="## [${title}](/$html_path)"
#   echo "$md_link" >> $temp_toc_file
# done

# pandoc $temp_toc_file -f markdown -o $1/$7/index.html ${2/"--toc"/""} --metadata-file=$3
# rm -f $temp_toc_file

# build/zip lab files
files=($(find ${6} -type f -name '*.md'))
# for item in ${files[*]}
# do
#   echo $item
# done