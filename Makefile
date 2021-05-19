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


# ===============================
# Options
# ===============================

# ALL PATH RELATED SETTINGS

# -------------------------------
## Directories
# -------------------------------
# Directory where to output build artifacts
# if you change this value also change build settings

BUILD_DIR = build/
LECTURES_DIR = lectures/
DOCS_DIR = docs/
LABS_DIR = labs/
LAB_TEMPLATES= templates/labs/
LABS_DIRS:= $(notdir $(shell find $(LABS_DIR) -mindepth 1  -maxdepth 1  -type d))


.SECONDEXPANSION:
$(BUILD_DIR)$(LABS_DIR)%.zip: $(LABS_DIR)$$(firstword $$(subst /, , $$*))/src/$$(lastword $$(subst /, , $$*))/*/Program.cs
# Here is how this works.
# This rule is called by e.g.
# make build/labs/HelloWorld/HelloWorld_Solution.zip
# And, because of .SECONDEXPANSION
# "%" in the target is evaluated first, 
# and it becomes "HelloWorld/HelloWorld_Solution"
# Then, the value in "%" is accessed thanks to $$* 
# in the pre-requisite, and
# (subst /, , $$*)
# becomes "HelloWorld HelloWorld_Solution"
# and then, taking the first part ("HelloWorld") or the 
# second ("HelloWorld_Solution") allows to re-construct the 
# correct path, as
# $(LABS_DIR)$$(firstword $$(subst /, , $$*))/src/$$(lastword $$(subst /, , $$*))/*/Program.cs
# becomes in this particular case
# labs/HelloWorld/src/HelloWorld_Solution/HelloWorld_Project/Program.cs
# which is indeed where the source code is located.
	echo $(dir $<)$(lastword $(subst /, , $*)).csproj # Where the csproj should go.
	echo $(patsubst %/,%.sln,$(dir $<)) # Where the sln should go.


# $(LABS_DIR)$$(firstword $$(subst /, , %))/src/$$(lastword $$(subst /, , %))/*/Program.cs
	
# Rule to make individual zip archive,
# e.g. 
# make build/labs/HelloWorld/HelloWorld.zip
#$(BUILD_DIR)$(LABS_DIR)%/: $(LABS_DIR)%/readme.m d$(LABS_DIR)%/src/*/*/Program.cs
#	echo $@
#	echo $<
#
#test:
#	echo $(BUILD_DIR)$(LABS_DIR)%/

# labs-source-code: 
# <Todo!>
# Previous version:
#labs: $(BUILD_DIR)
#	./build-labs.sh $(BUILD_DIR) $(LABS_DIR) $(LAB_TEMPLATES) "$(PANDOC_HTML_PAGES)" "" "" "$(PANDOC_HTML_PAGES)"



# -------------------------------
## Files
# -------------------------------

# The input match pattern for which files to include in "the book"
SOURCE_BOOK_FILES =  $(LECTURES_DIR)*/readme.md
# File where to get the metadata 
METADATA_FILE = templates/meta.yaml
# if you change this value also change all references to it!
TARGET_BOOK_FILE = $(BUILD_DIR)book
# where to find all of the following

### Files for documentation

SOURCE_DOC_FILES := $(shell find $(DOCS_DIR) -name '*.md')
# List all the .md files in DOCS_DIR
# Courtesy of https://stackoverflow.com/a/3774731

TARGET_DOC_FILES_HTML := $(addprefix $(BUILD_DIR), $(addsuffix .html, $(basename $(notdir $(SOURCE_DOC_FILES)))))
# 1. Look at the SOURCE_DOC_FILES, (e.g. "docs/about.md")
# 2. Extract the name file using notdir (e.g. "about.md"),
# 3. Extract the name of the file without the extension using basename (e.g. "about"),
# 4. Add the suffix ".html" (e.g. "about.html"),
# 5. Add the prefix "build" (e.g. "build/about.html").
# This allows to automatically build the list of targets (the build/html files)
# from the list of md files in docs.

TARGET_DOC_FILES_PDF := $(addprefix $(BUILD_DIR), $(addsuffix .pdf, $(basename $(notdir $(SOURCE_DOC_FILES)))))
# Similar to TARGET_DOC_FILES_HTML, but with pdf.

TARGET_DOC_FILES_ODT := $(addprefix $(BUILD_DIR), $(addsuffix .odt, $(basename $(notdir $(SOURCE_DOC_FILES)))))
# Similar to TARGET_DOC_FILES_HTML, but with odt.

### Files for labs

#### Instructions
# Beware, here, it is hard-coded that the lab file is called "readme.md"
SOURCE_LAB_INSTRUCTION_FILES := $(shell find $(LABS_DIR)*/readme.md)

TARGET_LAB_INSTRUCTION_FILES_HTML := $(addprefix $(BUILD_DIR), $(addsuffix index.html, $(dir $(SOURCE_LAB_INSTRUCTION_FILES))))
# 1. Look at the SOURCE_LAB_INSTRUCTION_FILES, (e.g. "labs/HelloWorld/readme.md")
# 2. Extract the folder path using dir (e.g. "labs/HelloWorld/"),
# 3. Append "index.html" to the end of it (e.g. "labs/HelloWorld/index.html"),
# 4. Add the prefix "build" (e.g. "build/labs/HelloWorld/index.html").
# This allows to automatically build the list of targets (the build/labs/*/index.html files)
# from the list of md files in the sub-folders in labs/.

TARGET_LAB_INSTRUCTION_FILES_PDF := $(addprefix $(BUILD_DIR), $(addsuffix index.pdf, $(dir $(SOURCE_LAB_INSTRUCTION_FILES))))
# Similar to TARGET_LAB_INSTRUCTION_FILES_HTML, but with pdf.

TARGET_LAB_INSTRUCTION_FILES_ODT := $(addprefix $(BUILD_DIR), $(addsuffix index.odt, $(dir $(SOURCE_LAB_INSTRUCTION_FILES))))
# Similar to TARGET_LAB_INSTRUCTION_FILES_HTML, but with odt.

#### Source Code
SOURCE_LAB_CODE_FILES := $(shell find $(LABS_DIR)*/src/ -name '*.cs')
# Find all the .cs files in the sub-folders "src/" in the sub-folders in "labs/"


# -------------------------------
## Performance & Global Options
# -------------------------------

MAKEFLAGS:= -j
# Maximize parallel execution whenever possible

# MAKEFILE OPTION
.DEFAULT_GOAL:= all
# By default, we construct all the files.

# -------------------------------
# Pandoc Settings
# -------------------------------

# Options for all output formats
PANDOC_OPTIONS = --toc --section-divs --filter pandoc-include -f markdown+emoji \
	--lua-filter templates/filters/default-code-class.lua -M default-code-class=csharp \
	-M date="$$(LANG=en_us_88591 date '+%B  %e, %Y (%r)')" \
        --metadata-file=$(METADATA_FILE)
	
# HTML build options
# Path to HTML templates to use with pandoc
WEBPATH = templates/web/
# generate index page for the website from this file
WEB_INDEX = index.md
404_PAGE = 404.md
# flags to apply to every HTML page
PANDOC_HTML_ALL = --self-contained --template=$(WEBPATH)template.html --css=$(WEBPATH)style.css	

# additional options for "non-index" pages
PANDOC_HTML_PAGES = $(PANDOC_OPTIONS) $(PANDOC_HTML_ALL) -B $(WEBPATH)header.html -A $(WEBPATH)footer.html --default-image-extension=svg

# PDF build options
PANDOC_PDF:= $(PANDOC_OPTIONS) -V links-as-notes --default-image-extension=pdf --pdf-engine=xelatex

# ODT build options
PANDOC_ODT:= $(PANDOC_OPTIONS) --default-image-extension=svg 

# ===============================
# Rules
# ===============================

# -------------------------------
## Misc.
# -------------------------------

.PHONY: clean
clean:
	@echo "cleaning build artifacts..."
	rm -rf $(BUILD_DIR)

$(BUILD_DIR): 
	@echo "starting build..."
	mkdir -p $(BUILD_DIR)
# This rule is added as a dependencies to some of the other rules,
# to ensure that the build directory has been created before creating files in it.

# -------------------------------
## Book
# -------------------------------

$(TARGET_BOOK_FILE).html: $(SOURCE_BOOK_FILES) | $(SOURCE_BOOK_FILES)
	pandoc $(SOURCE_BOOK_FILES) $(PANDOC_HTML_PAGES) -o $(TARGET_BOOK_FILE).html -M source_name=lectures/ -M target_name=book -M title="CSCI 1301 Book"
# Those two last variables are custom ones for pandoc, used in the html template to add download links
# to the pdf and odt versions, as well as a link to the folder with the source code.

$(TARGET_BOOK_FILE).pdf:  $(SOURCE_BOOK_FILES) | $(SOURCE_BOOK_FILES)
	pandoc $(SOURCE_BOOK_FILES) $(PANDOC_PDF) -o $(TARGET_BOOK_FILE).pdf -M title="CSCI 1301 Book"
	
$(TARGET_BOOK_FILE).odt:  $(SOURCE_BOOK_FILES) | $(SOURCE_BOOK_FILES)
	pandoc $(SOURCE_BOOK_FILES) $(PANDOC_ODT) -o $(TARGET_BOOK_FILE).odt -M title="CSCI 1301 Book"

# Whole book, in all formats.
book: $(TARGET_BOOK_FILE).html $(TARGET_BOOK_FILE).pdf $(TARGET_BOOK_FILE).odt

# -------------------------------
## Documentation Files
# -------------------------------

### Individual files
# Can be used to compile doc files individually e.g.
# make build/about.html
#### Individual HTML files.
$(BUILD_DIR)%.html: $(DOCS_DIR)%.md | $(BUILD_DIR)
	pandoc $(PANDOC_HTML_PAGES) $< -o $@ -M target_name=$(*F) -M source_name=$<
# Those two last variables are custom ones for pandoc, used in the html template to add download links
# to the pdf and odt versions, as well as a link to the original md source code.
# cf. https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html for an explanation of (@F).

#### Individual PDF files
$(BUILD_DIR)%.pdf: $(DOCS_DIR)%.md | $(BUILD_DIR)
	pandoc $(PANDOC_PDF) $< -o $@

#### Individual ODT files
$(BUILD_DIR)%.odt: $(DOCS_DIR)%.md | $(BUILD_DIR)
	pandoc $(PANDOC_ODT) $< -o $@

### Whole folders
# Compile all the documentation in a specific format, by calling the previous corresponding rule for each file.
#### HTML
docs-html:$(SOURCE_DOC_FILES)
	make $(TARGET_DOC_FILES_HTML)
#### PDF
docs-pdf:$(SOURCE_DOC_FILES)
	make $(TARGET_DOC_FILES_PDF)
#### ODT
docs-odt:$(SOURCE_DOC_FILES)
	make $(TARGET_DOC_FILES_ODT)

### Whole doc, in all formats.
docs: docs-html docs-pdf docs-odt

# -------------------------------
## Web Files
# -------------------------------

web-index: 
	pandoc $(WEB_INDEX) $(PANDOC_HTML_ALL) -o $(BUILD_DIR)index.html -A $(WEBPATH)footer.html
	pandoc $(404_PAGE) $(PANDOC_HTML_ALL) -o $(BUILD_DIR)404.html -A $(WEBPATH)footer.html

# -------------------------------
## Lab Files
# -------------------------------

### Instructions
#### Individual files
# Can be used to compile lab files individually e.g.
# make build/labs/HelloWorld/index.html
# mkdir -p $(dir $@)
# insures that the target directory exists.

##### Individual HTML files.
$(BUILD_DIR)$(LABS_DIR)%/index.html: $(LABS_DIR)%/readme.md
	mkdir -p $(dir $@)
	pandoc $(PANDOC_HTML_PAGES) -A $(LAB_TEMPLATES)feedback.html $< -o $@ -M target_name=index
# This last variable is a custom one, used in the template to add download links
# to the pdf and odt versions.

##### Individual PDF files.
$(BUILD_DIR)$(LABS_DIR)%/index.pdf: $(LABS_DIR)%/readme.md
	mkdir -p $(dir $@)
	pandoc $(PANDOC_PDF) $< -o $@ 
##### Individual ODT files.
$(BUILD_DIR)$(LABS_DIR)%/index.odt: $(LABS_DIR)%/readme.md
	mkdir -p $(dir $@)
	pandoc $(PANDOC_ODT) $< -o $@ 
	
#### Whole folders
# Compile all the labs in a specific format, by calling the previous corresponding rule for each file.
##### HTML
labs-html:$(SOURCE_LAB_INSTRUCTION_FILES)
	make $(TARGET_LAB_INSTRUCTION_FILES_HTML)
##### PDF
labs-pdf:$(SOURCE_LAB_INSTRUCTION_FILES)
	make $(TARGET_LAB_INSTRUCTION_FILES_PDF)
##### ODT
labs-odt:$(SOURCE_LAB_INSTRUCTION_FILES)
	make $(TARGET_LAB_INSTRUCTION_FILES_ODT)

#### Index page for labs
$(BUILD_DIR)$(LABS_DIR)index.html: $(LABS_DIR)*/readme.md # Add source code as dependency as well
	(cat $(LAB_TEMPLATES)labs.md && echo '\n' && for dir in $(LABS_DIRS); do  echo  ' | <a href="'$${dir}'">'$${dir}'</a> | \n'; done) | pandoc -o $@ $(PANDOC_HTML_PAGES) -A $(LAB_TEMPLATES)feedback.html 
# I don't think we need odt / pdf for that page.
	
#### Whole labs instructions, in all formats.
labs-instructions: labs-html labs-pdf labs-odt
### Source Code


### Instructions and Source Code

labs: labs-instructions # labs-source-code



# -------------------------------
## Other Useful Rules
# -------------------------------

web: docs-html web-index $(TARGET_BOOK_FILE).html

build: docs web-index book labs

all: build

# Useful to debug: call
# Make test
# to display the variable 
.PHONY: test
# "Plug" below the variable you want to test, $(<here>)
test = $(LABS_DIRS)
$(info $$test is [${test}])
