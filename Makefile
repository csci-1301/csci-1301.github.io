help:
	@echo "build - build everything"
	@echo "clean - remove generated build artifacts"

# ===============================
# Options
# ===============================

# directory where to output build artifacts
# if you change this value also change .travis.yml
BUILD_DIR = build
# The input match pattern for which files to include in "the book"
BOOK_FILES = lectures/meta.md lectures/*/index.md
# if you change this value also change all references to it
OUT_FILENAME = $(BUILD_DIR)/book

# Pandoc options for all output formats
PANDOC_OPTIONS:= --toc --section-divs
# --filter pandoc-include  # inject inline code blocks

# Path to HTML templates to use with pandoc
WEBPATH = templates/web/
# HTML build options
PANDOC_HTML:= $(PANDOC_OPTIONS) --self-contained --css=$(WEBPATH)style.css -A $(WEBPATH)footer.html -B $(WEBPATH)header.html

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

extras:
	./extra.sh $(BUILD_DIR) "$(PANDOC_HTML)"

pre-build:
	@echo "starting build..."
	test -d $(BUILD_DIR) || mkdir $(BUILD_DIR)

build-html:
	pandoc index.md --self-contained --css=$(WEBPATH)style.css -A $(WEBPATH)footer.html -o $(BUILD_DIR)/index.html	
	pandoc $(BOOK_FILES) $(PANDOC_HTML) -o $(OUT_FILENAME).html

build-pdf:
	pandoc $(BOOK_FILES) $(PANDOC_PDF) -o $(OUT_FILENAME).pdf
	
build-odt:
	pandoc $(BOOK_FILES) $(PANDOC_ODT) -o $(OUT_FILENAME).odt

all: build