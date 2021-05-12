help:
	@echo "build - build everything"
	@echo "clean - remove generated build artifacts"

# ===============================
# Options
# ===============================

# ALL PATH RELATED SETTINGS
# directory where to output build artifacts
# if you change this value also change .travis.yml
BUILD_DIR = build
# The input match pattern for which files to include in "the book"
BOOK_FILES =  lectures/*/readme.md
# File where to get book metadata 
METADATA_FILE = templates/meta.md
# if you change this value also change all references to it!
OUT_FILENAME = $(BUILD_DIR)/book
# where to find the following
DOCS_DIR = docs
LECTURES_DIR = lectures
LABS_DIR = labs
PAGES = pages

# PANDOC SETTINGS
# Options for all output formats
PANDOC_OPTIONS:= --toc --section-divs --filter pandoc-include
#
# HTML build options
# Path to HTML templates to use with pandoc
WEBPATH = templates/web/
# generate index page for the website from this file
WEB_INDEX = index.md
# flags to apply to every HTML page
PANDOC_HTML_ALL = --self-contained --template=$(WEBPATH)template.html --css=$(WEBPATH)style.css -A $(WEBPATH)footer.html -f markdown+emoji
# additional options for "non-index" pages
PANDOC_HTML_PAGES:= $(PANDOC_OPTIONS) $(PANDOC_HTML_ALL)  -B $(WEBPATH)header.html
# header template for pages
PAGES_HEADER=$(WEBPATH)header_book.html
#
# PDF build options
# apparently this is a thing: unrecognized option `--pdf-engine-opt=-shell-escape'
# also this is a thing: may need another apt-get pandoc: unrecognized option `--pdf-engine=xelatex'
PANDOC_PDF:= $(PANDOC_OPTIONS) -V links-as-notes --default-image-extension=pdf
#
# ODT build options
PANDOC_ODT:= $(PANDOC_OPTIONS) --default-image-extension=svg 

# ===============================
# Rules
# ===============================

build: pre-build build-html build-pdf build-odt extras

.PHONY: clean
clean:
	@echo "cleaning build artifacts..."
	rm -rf $(BUILD_DIR)

pre-build:
	@echo "starting build..."
	test -d $(BUILD_DIR) || mkdir $(BUILD_DIR)

build-html:
	pandoc $(WEB_INDEX) $(PANDOC_HTML_ALL) -o $(BUILD_DIR)/index.html	
	pandoc $(BOOK_FILES) $(PANDOC_HTML_PAGES) -o $(OUT_FILENAME).html --metadata-file=$(METADATA_FILE)

build-pdf:
	pandoc $(BOOK_FILES) $(PANDOC_PDF) -o $(OUT_FILENAME).pdf --metadata-file=$(METADATA_FILE)
	
build-odt:
	pandoc $(BOOK_FILES) $(PANDOC_ODT) -o $(OUT_FILENAME).odt --metadata-file=$(METADATA_FILE)

extras:
	./extra.sh $(BUILD_DIR) "$(PANDOC_HTML_PAGES)" $(METADATA_FILE) $(DOCS_DIR) $(LECTURES_DIR) $(LABS_DIR) $(PAGES) $(PAGES_HEADER) 

all: build