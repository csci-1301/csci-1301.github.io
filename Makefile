help:
	@echo "all - build everything"
	@echo "all-books - build books only (in all formats)"
	@echo "web-only - to test web rendering only"
	@echo "clean - remove generated build artifacts"

# ===============================
# Options
# ===============================

# ALL PATH RELATED SETTINGS
# directory where to output build artifacts
# if you change this value also change build settings
BUILD_DIR = build
# The input match pattern for which files to include in "the book"
BOOK_FILES =  lectures/*/readme.md
# File where to get book metadata 
METADATA_FILE = templates/meta.md
# if you change this value also change all references to it!
OUT_FILENAME = $(BUILD_DIR)/book
# where to find all of the following
LECTURES_DIR = lectures
DOCS_DIR = docs
LABS_DIR = labs

# PANDOC SETTINGS
# Options for all output formats
PANDOC_OPTIONS:= --toc --section-divs --filter pandoc-include -f markdown+emoji \
	--lua-filter templates/filters/default-code-class.lua -M default-code-class=csharp
#
# HTML build options
# Path to HTML templates to use with pandoc
WEBPATH = templates/web/
# generate index page for the website from this file
WEB_INDEX = index.md
# flags to apply to every HTML page
PANDOC_HTML_ALL = --self-contained --template=$(WEBPATH)template.html --css=$(WEBPATH)style.css -A $(WEBPATH)footer.html
# additional options for "non-index" pages
PANDOC_HTML_PAGES:= $(PANDOC_OPTIONS) $(PANDOC_HTML_ALL)  -B $(WEBPATH)header.html
#
# PDF build options
PANDOC_PDF:= $(PANDOC_OPTIONS) -V links-as-notes --default-image-extension=pdf --pdf-engine=xelatex
#
# ODT build options
PANDOC_ODT:= $(PANDOC_OPTIONS) --default-image-extension=svg 

# ===============================
# Rules
# ===============================

.PHONY: clean
clean:
	@echo "cleaning build artifacts..."
	rm -rf $(BUILD_DIR)

pre-build:
	@echo "starting build..."
	test -d $(BUILD_DIR) || mkdir $(BUILD_DIR)

book-html:
	pandoc $(BOOK_FILES) $(PANDOC_HTML_PAGES) -o $(OUT_FILENAME).html --metadata-file=$(METADATA_FILE)

book-pdf:
	pandoc $(BOOK_FILES) $(PANDOC_PDF) -o $(OUT_FILENAME).pdf --metadata-file=$(METADATA_FILE)
	
book-odt:
	pandoc $(BOOK_FILES) $(PANDOC_ODT) -o $(OUT_FILENAME).odt --metadata-file=$(METADATA_FILE)

build-docs-html:
	 $(foreach file, $(wildcard $(DOCS_DIR)/*), pandoc $(file) -o $(BUILD_DIR)/$(subst .md,,$(subst $(DOCS_DIR)/,,$(file))).html $(PANDOC_HTML_PAGES) ;)

build-docs-pdf:
	 $(foreach file, $(wildcard $(DOCS_DIR)/*), pandoc $(file) -o $(BUILD_DIR)/$(subst .md,,$(subst $(DOCS_DIR)/,,$(file))).pdf $(PANDOC_PDF) ;)

build-docs-odt:
	 $(foreach file, $(wildcard $(DOCS_DIR)/*), pandoc $(file) -o $(BUILD_DIR)/$(subst .md,,$(subst $(DOCS_DIR)/,,$(file))).odt $(PANDOC_ODT) ;)

build-web-index:
	pandoc $(WEB_INDEX) $(PANDOC_HTML_ALL) -o $(BUILD_DIR)/index.html	

extras:
	./extra.sh $(BUILD_DIR) $(LABS_DIR) "$(PANDOC_HTML_PAGES)" "$(PANDOC_PDF)" "$(PANDOC_ODT)"

all-books: pre-build book-html book-pdf book-odt

web-only: pre-build build-docs-html build-web-index book-html

build: pre-build build-docs-html build-docs-pdf build-docs-odt build-web-index book-html book-pdf book-odt extras

all: build