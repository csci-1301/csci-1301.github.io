help:
	@echo "build - build a package"
	@echo "clean - remove generated build artifacts"
	@echo "labs - package labs files"

# ===============================
# Options
# ===============================

# directory where to output build artifacts
# if you change this value also change .travis.yml
BUILD_DIR = build
# The input to convert with pandoc
INPUT_FILE = lectures/*/index.md
# if you change this value also change .travis.yml and any references to it
OUT_FILENAME = $(BUILD_DIR)/book

# Pandoc options for all output formats
PANDOCOPTIONS:= $(INPUT_FILE) --toc --section-divs
# --filter pandoc-include  # inject inline code blocks

# Path to HTML templates to use with pandoc
WEBPATH = templates/web/
# HTML build options
PANDOCHTML:= $(PANDOCOPTIONS) --self-contained --css=$(WEBPATH)style.css -A $(WEBPATH)footer.html -B $(WEBPATH)header.html

# pandoc options for building pdf
# apparently this is a thing: unrecognized option `--pdf-engine-opt=-shell-escape'
# also this is a thing: may need another apt-get pandoc: unrecognized option `--pdf-engine=xelatex'
PANDOCPDF:= $(PANDOCOPTIONS) -V links-as-notes --default-image-extension=pdf

# pandoc options for building odt
PANDOCODT:= $(PANDOCOPTIONS) --default-image-extension=svg 

# ===============================
# Rules
# ===============================

build: pre-build build-html build-pdf build-odt

clean:
	@echo "cleaning build artifacts..."
	rm -fr $(BUILD_DIR)

labs:
	@echo "packaging labs..."
	# TODO: write a script to zip lab files

pre-build:
	@echo "starting build..."
	test -d $(BUILD_DIR) || mkdir $(BUILD_DIR) 	

build-html:
	pandoc docs/index.md --self-contained --css=$(WEBPATH)style.css -o $(BUILD_DIR)/index.html
	pandoc $(PANDOCHTML) -o $(OUT_FILENAME).html

build-pdf:
	pandoc $(PANDOCPDF) -o $(OUT_FILENAME).pdf
	
build-odt:
	pandoc $(PANDOCODT) -o $(OUT_FILENAME).odt

all: build



