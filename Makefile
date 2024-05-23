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


SOURCE_MD_FILES := $(shell find lectures/ docs/ labs/ -name '*.md')
TARGET_MD_FILES = $(addprefix $(BUILD_DIR), $(SOURCE_MD_FILES))

METADATA_FILE = templates/meta.yaml


# Options for all output formats
PANDOC_OPTIONS = --toc --section-divs --filter pandoc-include -f markdown+emoji \
--lua-filter templates/filters/default-code-class.lua -M default-code-class=csharp \
-M date="$$(LANG=en_us_88591 TZ='America/New_York' date '+%B  %e, %Y (%r)')" \
--metadata-file=$(METADATA_FILE)  --email-obfuscation=references

# HTML build options
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

# MD build options
PANDOC_MD_PAGES = $(PANDOC_OPTIONS)

$(BUILD_DIR)%.md: %.md
	@mkdir -p $(dir $@)
	pandoc $(PANDOC_MD_PAGES) $< -o $@

all: $(TARGET_MD_FILES)



# Phony rule to display variables
.PHONY: test
$(info $$SOURCE_MD_FILES is [${TARGET_MD_FILES}])

