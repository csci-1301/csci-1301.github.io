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

# -------------------------------
## Files
# -------------------------------

# The input match pattern for which files to include in "the book"
SOURCE_BOOK_FILES =  lectures/*/readme.md
# File where to get book metadata 
METADATA_FILE = templates/book_meta.md
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
PANDOC_OPTIONS:= --toc --section-divs --filter pandoc-include -f markdown+emoji \
	--lua-filter templates/filters/default-code-class.lua -M default-code-class=csharp \
	-M date="$$(LANG=en_us_88591 date '+%B  %e, %Y (%r)')" 

# HTML build options
# Path to HTML templates to use with pandoc
WEBPATH = templates/web/
# generate index page for the website from this file
WEB_INDEX = index.md
404_PAGE = 404.md
# flags to apply to every HTML page
PANDOC_HTML_ALL = --self-contained --template=$(WEBPATH)template.html --css=$(WEBPATH)style.css 
# additional options for "non-index" pages
PANDOC_HTML_PAGES:= $(PANDOC_OPTIONS) $(PANDOC_HTML_ALL) -B $(WEBPATH)header.html -A $(WEBPATH)footer.html

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

$(TARGET_BOOK_FILE).html: $(BUILD_DIR)
	pandoc $(SOURCE_BOOK_FILES) $(PANDOC_HTML_PAGES) -o $(TARGET_BOOK_FILE).html --metadata-file=$(METADATA_FILE)

$(TARGET_BOOK_FILE).pdf: $(BUILD_DIR)
	pandoc $(SOURCE_BOOK_FILES) $(PANDOC_PDF) -o $(TARGET_BOOK_FILE).pdf --metadata-file=$(METADATA_FILE)
	
$(TARGET_BOOK_FILE).odt: $(BUILD_DIR)
	pandoc $(SOURCE_BOOK_FILES) $(PANDOC_ODT) -o $(TARGET_BOOK_FILE).odt --metadata-file=$(METADATA_FILE)

# Whole book, in all formats.
book: $(TARGET_BOOK_FILE).html $(TARGET_BOOK_FILE).pdf $(TARGET_BOOK_FILE).odt

# -------------------------------
## Documentation Files
# -------------------------------

### Individual files
# Can be used to compile doc files individually e.g.
# make build/about.html
#### Individual HTML files.
$(BUILD_DIR)%.html: $(DOCS_DIR)%.md $(BUILD_DIR)
	pandoc $(PANDOC_HTML_PAGES) $< -o $@ 

#### Individual PDF files
$(BUILD_DIR)%.pdf: $(DOCS_DIR)%.md $(BUILD_DIR)
	pandoc $(PANDOC_PDF) $< -o $@

#### Individual ODT files
$(BUILD_DIR)%.odt: $(DOCS_DIR)%.md $(BUILD_DIR)
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
## Lab Files
# -------------------------------

web-index: 
	pandoc $(WEB_INDEX) $(PANDOC_HTML_ALL) -o $(BUILD_DIR)/index.html -A $(WEBPATH)footer.html
	pandoc $(404_PAGE) $(PANDOC_HTML_ALL) -o $(BUILD_DIR)/404.html -A $(WEBPATH)footer.html

# -------------------------------
## Lab Files
# -------------------------------

labs: $(BUILD_DIR)
	./build-labs.sh $(BUILD_DIR) $(LABS_DIR) $(LAB_TEMPLATES) "$(PANDOC_HTML_PAGES)" "$(PANDOC_PDF)" "$(PANDOC_ODT)" "$(PANDOC_HTML_PAGES)"

# -------------------------------
## Other Useful Rules
# -------------------------------

web: docs-html web-index $(TARGET_BOOK_FILE).html

build: docs web-index book labs

all: build

# Useful to debug: call
# Make test
# to display the variable 
# .PHONY: test
# $(info $$TARGET_DOC_FILES_HTML is [${TARGET_DOC_FILES_HTML}])
