#!/bin/bash

# this is a build script to build & zip lab files
# no idea how to do this in make so bash script it is...

# ===========================
# Positional args: 
# $1 - build output directory
# $2 - labs directory
# $3 - lab templates
# $4 - pandoc HTML flags (for labs)
# $5 - pandoc pdf flags
# $6 - pandoc odt flags
# $7 - HTML flags (for index)
# ============================

BUILD_DIR=$1
LABS_DIR=$2
TEMPLATES=$3
HTML_FLAGS=$4
PDF_FLAGS=$5
ODT_FLAGS=$6
INDEX_HTML=$7

# where to output labs
OUT_DIR=$BUILD_DIR/$LABS_DIR
# input files
INSTRUCTIONS_FILE="readme.md"
SRC_DIR="src"
# templates, read into variables
TEMPLATE_SLN=`cat ${TEMPLATES}solution.sln`
TEMPLATE_PRJ=`cat ${TEMPLATES}project.csproj` 
INDEX=`cat ${TEMPLATES}labs.md`
PLACEHOLDER="lab_name"

# ensure output directory for labs exists
test -d $OUT_DIR || mkdir $OUT_DIR

# iterate all lab source directories
for d in ${LABS_DIR}/*/ ; do

    # get lab name and create a directory for it
    lab_name="$(basename "$d")"
    lab_dir=$OUT_DIR/$lab_name
    test -d $lab_dir || mkdir $lab_dir
    src="-"

    # all labs need instructions
    if [ -f ${d}/$INSTRUCTIONS_FILE ] ; then

        # if lab contains source code, make a C# solution out of it
        if [[ -d ${d}${SRC_DIR} ]] ; then
            mkfifo $lab_name.sln $lab_name.csproj
            echo "${TEMPLATE_SLN//$PLACEHOLDER/$lab_name}" > $lab_name.sln &
            echo "${TEMPLATE_PRJ//$PLACEHOLDER/$lab_name}" > $lab_name.csproj &
            zip -r -j --fifo $lab_dir/$lab_name.zip ${d}${SRC_DIR}/* $lab_name.sln $lab_name.csproj
            rm $lab_name.sln $lab_name.csproj        
            src="[$lab_name.zip](/$LABS_DIR/$lab_name/$lab_name.zip)"
        fi

       # generate lab instructions files in all formats
        pandoc ${d}/$INSTRUCTIONS_FILE $HTML_FLAGS -o $lab_dir/index.html
        pandoc ${d}/$INSTRUCTIONS_FILE $PDF_FLAGS  -o $lab_dir/index.pdf
        pandoc ${d}/$INSTRUCTIONS_FILE $ODT_FLAGS  -o $lab_dir/index.odt

        # appends links to lab in the index file
        html="[HTML](/$LABS_DIR/$lab_name/index.html)"
        pdf="[PDF](/$LABS_DIR/$lab_name/index.pdf)"
        odt="[ODT](/$LABS_DIR/$lab_name/index.odt)"
        INDEX+="
${lab_name} | $html $pdf $odt | $src "
    fi
done

# make a zip file of all labs
cd $BUILD_DIR ; zip -r labs.zip $LABS_DIR/* ; cd ..
  
# write out the index file listing all labs
pandoc -o $OUT_DIR/index.html $INDEX_HTML -f markdown -t html <(echo "$INDEX")
pandoc -o $OUT_DIR/index.pdf $PDF_FLAGS -f markdown -t pdf <(echo "$INDEX")
pandoc -o $OUT_DIR/index.odt $ODT_FLAGS -f markdown -t odt <(echo "$INDEX")
