#!/bin/bash

# extra build steps

# ===========================
# Positional args: 
# $1 - build output directory
# $2 - labs directory
# $3 - pandoc HTML flags
# $4 - pandoc pdf flags
# $5 - pandoc odt flags
# ============================

BUILD_DIR=$1
LABS_DIR=$2
HTML_FLAGS=$3
PDF_FLAGS=$4
ODT_FLAGS=$5

# build & zip lab files
files=($(find ${LABS_DIR} -type f -name '*.md'))
# for item in ${files[*]}
# do
#   echo $item
# done