help:
	@echo "build - build everything"
	@echo "clean - remove generated build artifacts"

# ===============================
# Options
# ===============================

# directory where to output build artifacts
# if you change this value also change .travis.yml
BUILD_DIR = build
METADATA_FILE = meta.md
# The input match pattern for which files to include in "the book"
BOOK_FILES =  lectures/*/index.md
# if you change this value also change all references to it
OUT_FILENAME = $(BUILD_DIR)/book

# Pandoc options for all output formats
# --filter pandoc-include  # inject inline code blocks
PANDOC_OPTIONS:= --toc --section-divs 

# Path to HTML templates to use with pandoc
WEBPATH = templates/web/
WEB_INDEX = index.md
# HTML build options
# flags to apply to every HTML page
PANDOC_HTML_ALL = --self-contained --css=$(WEBPATH)style.css -A $(WEBPATH)footer.html -f markdown+emoji
# additional options for "non-index" pages
PANDOC_HTML_PAGES:= $(PANDOC_OPTIONS) $(PANDOC_HTML_ALL)  -B $(WEBPATH)header.html

# pandoc options for building pdf
# apparently this is a thing: unrecognized option `--pdf-engine-opt=-shell-escape'
# also this is a thing: may need another apt-get pandoc: unrecognized option `--pdf-engine=xelatex'
PANDOC_PDF:= $(PANDOC_OPTIONS) -V links-as-notes --default-image-extension=pdf

# pandoc options for building odt
PANDOC_ODT:= $(PANDOC_OPTIONS) --default-image-extension=svg 

# ===============================
# Rules
# ===============================

build: pre-build build-html build-pdf build-odt extras

.PHONY: clean
clean:
	@echo "cleaning build artifacts..."
	rm -fr $(BUILD_DIR)

pre-build:
	@echo "starting build..."
	test -d $(BUILD_DIR) || mkdir $(BUILD_DIR)

build-html:
	pandoc $(WEB_INDEX) $(PANDOC_HTML_ALL) -o $(BUILD_DIR)/index.html	
	pandoc $(BOOK_FILES) $(PANDOC_HTML_PAGES) -o $(OUT_FILENAME).html --metadata-file=$(METADATA_FILE) --shift-heading-level-by=1

build-pdf:
	pandoc $(BOOK_FILES) $(PANDOC_PDF) -o $(OUT_FILENAME).pdf --metadata-file=$(METADATA_FILE)
	
build-odt:
	pandoc $(BOOK_FILES) $(PANDOC_ODT) -o $(OUT_FILENAME).odt --metadata-file=$(METADATA_FILE)

extras:
	./extra.sh $(BUILD_DIR) "$(PANDOC_HTML_PAGES)" $(METADATA_FILE)

all: build