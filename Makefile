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

# TODO: add filters
PANDOCOPTIONS:= lectures/hello_world/index.md --toc --section-divs --extract-media $(BUILD_DIR)
# --filter pandoc-include  # inject inline code blocks

# Path to HTML templates to use with pandoc
WEBPATH = templates/web/
PANDOCHTML:= $(PANDOCOPTIONS) --include-in-header=$(WEBPATH)style.css -B $(WEBPATH)header.html -A $(WEBPATH)footer.html

# pandoc configuration options for building pdf
# apparently this is a thing: unrecognized option `--pdf-engine-opt=-shell-escape'
# also this is a thing: may need another apt-get pandoc: unrecognized option `--pdf-engine=xelatex'
PANDOCPDF:= $(PANDOCOPTIONS) -V links-as-notes --default-image-extension=pdf
# if you change this value also change .travis.yml
PDF_FILENAME:= CS1301

# pandoc configuration options for building odt
PANDOCODT:= $(PANDOCOPTIONS) --default-image-extension=svg 
# if you change this value also change .travis.yml
ODT_FILENAME:= CS1301

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
	# ensure build output directory exists 
	test -d $(BUILD_DIR) || mkdir $(BUILD_DIR) 	

build-html:
	pandoc $(PANDOCHTML) -o $(BUILD_DIR)/index.html

build-pdf:
	pandoc $(PANDOCPDF) -o $(BUILD_DIR)/$(PDF_FILENAME).pdf
	
build-odt:
	pandoc $(PANDOCODT) -o $(BUILD_DIR)/$(ODT_FILENAME).odt

all: build
