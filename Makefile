help:
	@echo "all - build everything"
	@echo "book - build books only (in all formats)"
	@echo "labs - build labs only"
	@echo "web - build html only, useful for testing web rendering"
	@echo "clean - remove generated build artifacts"

# ===============================
# Useful Makefile doc. 
# ===============================
# - https://www.gnu.org/software/make/manual/html_node/File-Name-Functions.html
# - https://gist.github.com/rueycheng/42e355d1480fd7a33ee81c866c7fdf78
# - https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html
# - https://github.com/markpiffer/gmtt#call-wildcard-reclist-of-globs
# - https://devhints.io/makefile

# ===============================
# Options
# ===============================

# ALL PATH RELATED SETTINGS

# -------------------------------
## Directories
# -------------------------------
# Directory where to output build artifacts
# if you change this value also change build settings

BUILD_DIR = content/
LECTURES_DIR = lectures/
DOCS_DIR = docs/
LABS_DIR = labs/
LAB_TEMPLATES= templates/labs/
LABS_DIRS:= $(notdir $(shell find $(LABS_DIR) -mindepth 1  -maxdepth 1  -type d | sort))


SOURCE_MD_FILES := $(shell find lectures/ docs/ labs/ . -name '*.md')
TARGET_MD_FILES = $(addprefix $(BUILD_DIR), $(SOURCE_MD_FILES))

METADATA_FILE = templates/meta.yaml

# Path to PDF templates to use with pandoc
PDFPATH = templates/latex/
# Path to ODT templates to use with pandoc
ODTPATH = templates/odt/
# Path to DOCX templates to use with pandoc
DOCXPATH = templates/docx/
# generate index page for the website from this file
WEB_INDEX = index.md
404_PAGE = 404.md

# flags to apply

# Options for all output formats
PANDOC_OPTIONS = --section-divs --filter pandoc-include -f markdown+emoji \
-M default-code-class=csharp \
-M date="$$(git log -1 --format=%cd --date=short -- $<)" \
--strip-comments --email-obfuscation=references --metadata-file=$(METADATA_FILE)

# Potentially, to have some kind of alternate callouts:
# --lua-filter templates/filters/callouts.lua

# We use the for the date the last time the file was edited according to git.
# To use the current date / time instead, use:
#-M date="$$(LANG=en_us_88591 TZ='America/New_York' date '+%B  %e, %Y (%r)')" \


# MD build options
PANDOC_MD = $(PANDOC_OPTIONS) --standalone --lua-filter templates/filters/default-code-class-block.lua --shift-heading-level-by=-1 --to gfm+pipe_tables
# -s/--standalone is required to save the metadata block.


# Remember to add
# --toc --lua-filter templates/filters/default-code-class-block-inline.lua
#
# documentclass: scrartcl  # templating
# numbersections: true     # templating
# papersize: letter        # templating
# geometry: margin=1in     # templating
# to pandoc's options for pdf, odt, docx (not sure about the use for the last four for docx / odt)

$(BUILD_DIR)%.md: %.md
	@mkdir -p $(dir $@)
	pandoc $(PANDOC_MD) $< -o $@

WOFF_FONT_FILES := $(shell find templates/fonts/ -iname "*.woff*")
TARGET_WOFF_FONT_FILES := $(addprefix $(BUILD_DIR), $(patsubst templates/%,%,$(WOFF_FONT_FILES)))

# Individual woff font files:
$(BUILD_DIR)fonts/%.woff : templates/fonts/%.woff
	mkdir -p $(dir $@)
	rsync -av $< $@
	
# Individual woff2 font files:
$(BUILD_DIR)fonts/%.woff2 : templates/fonts/%.woff2
	mkdir -p $(dir $@)
	rsync -av $< $@

all: $(TARGET_MD_FILES) $(TARGET_WOFF_FONT_FILES)

# Phony rule to display variables
.PHONY: test
$(info $$SOURCE_MD_FILES is [${SOURCE_MD_FILES}])

.PHONY: clean
clean:
	@echo "cleaning build artifacts..."
	@rm -rf $(BUILD_DIR)

###############################################
# Order: this part of the Makefile consider   #
# the order in the ./order file to            #
# 1. Construct the "web-order.ts" file, that  #
#    determine the order used in the menu on  #
#    the website.                             #
# 2. Determine in which order pandoc needs    #
#    
################

# The following rule is needed to construct the order 
# in the menu on the website, and the order used to integrate the notes.

# To obtain and update the order file, use something along the lines of 
# tree -f -P "*.md" --prune | sed 's/.*├──//g' | sed 's/.*│//g' | sed 's/.*└──//g' | sed 's/.*index\.md//g'  | sed -r '/^\s*$/d'

# Order for website
# The regular expression 
# 's-([^/]*/)*((.)*)$$-\2-g'
# goes from e.g.,
# ./lectures/misc/over_under_flow.md
# to 
# over_under_flow
# and from e.g.,
# ./docs/academic_life
# to 
# academic_life
# Note that we keep the *second* capture group.
web-order.ts: order
	echo -n "// This file was generated automatically by calling make web-order.ts.\n// Refer to the Makefile to read indications on how to generate and edit it.\nexport const nameOrderMap: Record<string, number> = {\n" > $@
	@n=0 ;
	@while read -r line; do \
		n=$$((n+1)); \
		echo -n '\t"' >> $@;\
		echo -n "$$line" | sed -E 's-([^/]*/)*((.)*)$$-\2-g' | sed 's-\.md--g' >> $@;\
		echo -n "\": $$n,\n"  >> $@ ;\
	done < order
	echo "}" >> $@

#test:
#	pandoc $(shell cat order | grep -E "./lectures/.*.md|./docs/.*md") -o test.html 

