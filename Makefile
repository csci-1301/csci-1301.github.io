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

BUILD_DIR = build/
LECTURES_DIR = lectures/
DOCS_DIR = docs/
LABS_DIR = labs/
LAB_TEMPLATES= templates/labs/
LABS_DIRS:= $(notdir $(shell find $(LABS_DIR) -mindepth 1  -maxdepth 1  -type d))

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
# 2. Extract the directory path using dir (e.g. "labs/HelloWorld/"),
# 3. Append "index.html" to the end of it (e.g. "labs/HelloWorld/index.html"),
# 4. Add the prefix "build" (e.g. "build/labs/HelloWorld/index.html").
# This allows to automatically build the list of targets (the build/labs/*/index.html files)
# from the list of md files in the sub-directories in labs/.

TARGET_LAB_INSTRUCTION_FILES_PDF := $(addprefix $(BUILD_DIR), $(addsuffix index.pdf, $(dir $(SOURCE_LAB_INSTRUCTION_FILES))))
# Similar to TARGET_LAB_INSTRUCTION_FILES_HTML, but with pdf.

TARGET_LAB_INSTRUCTION_FILES_ODT := $(addprefix $(BUILD_DIR), $(addsuffix index.odt, $(dir $(SOURCE_LAB_INSTRUCTION_FILES))))
# Similar to TARGET_LAB_INSTRUCTION_FILES_HTML, but with odt.

#### Source Code

# The following Makefile trickery was possible thanks to 
# https://stackoverflow.com/a/67600525
# Extract directories that contain Program.cs files in the lab directory.
SOURCEDIRS := $(dir $(wildcard $(LABS_DIR)*/src/*/*/Program.cs))

# Generate archive names: drop the /src/ part and add .zip extension
ARCHIVES := $(patsubst %/,%.zip,$(subst /src/,/,$(dir $(SOURCEDIRS:/=))))
# Suppose SOURCEDIRS contains "labs/HelloWorld/src/HelloWorld_Solution/HelloWorld_Project/Program.cs",
# this does the following:
# $(SOURCEDIRS:/=) is SOURCEDIRS without the "Program.cs" part ("labs/HelloWorld/src/HelloWorld_Solution/HelloWorld_Project")
# $(dir $(SOURCEDIRS:/=)) furthermore removes the Project part ("labs/HelloWorld/src/HelloWorld_Solution/")
# $(subst /src/,/,$(dir $(SOURCEDIRS:/=)) furthermore replaces /src/ with noting ("labs/HelloWorld/HelloWorld_Solution/")
# $(patsubst %/,%.zip,$(subst /src/,/,$(dir $(SOURCEDIRS:/=)))) finally replaces the last "/" with ".zip" ("labs/HelloWorld/HelloWorld_Solution.zip")

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
# Path to PDF templates to use with pandoc
PDFPATH = templates/latex/
# generate index page for the website from this file
WEB_INDEX = index.md
404_PAGE = 404.md
# flags to apply to every HTML page
PANDOC_HTML_PAGES = $(PANDOC_OPTIONS) -B $(WEBPATH)header.html -A $(WEBPATH)footer.html --default-image-extension=svg --standalone --template=$(WEBPATH)template.html

# PDF build options
PANDOC_PDF:= $(PANDOC_OPTIONS) -V links-as-notes --default-image-extension=pdf --pdf-engine=xelatex --include-in-header=$(PDFPATH)header.tex

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

$(BUILD_DIR) $(BUILD_DIR)img/ $(BUILD_DIR)$(LABS_DIR): 
	@echo "starting build..."
	mkdir -p $(BUILD_DIR)$(LABS_DIR) $(BUILD_DIR)img/
	rsync -av img/favicon/* $(BUILD_DIR)
	find img -maxdepth 1 -type f | xargs -I {} cp {}  $(BUILD_DIR)img # We copy only the files, and not the folder.
	rsync -av $(WEBPATH)style.css $(BUILD_DIR)
# This rule is added as a dependencies to some of the other rules,
# to ensure that the build directory has been created before creating files in it.
# It also copy the favicon and css files to the right place.

# -------------------------------
## Book
# -------------------------------

$(TARGET_BOOK_FILE).html: $(SOURCE_BOOK_FILES) | $(SOURCE_BOOK_FILES) $(BUILD_DIR) 
	pandoc $(SOURCE_BOOK_FILES) $(PANDOC_HTML_PAGES) -o $(TARGET_BOOK_FILE).html -M source_name=lectures/ -M target_name=book -M title="CSCI 1301 Book" -M path_to_root=$(subst $() ,,$(foreach v,$(subst /, ,$(subst $(BUILD_DIR),,$(dir $@))),../))
# Those two last variables are custom ones for pandoc, used in the html template to add download links
# to the pdf and odt versions, as well as a link to the directory with the source code.

$(TARGET_BOOK_FILE).pdf:  $(SOURCE_BOOK_FILES) | $(SOURCE_BOOK_FILES) $(BUILD_DIR)
	pandoc $(SOURCE_BOOK_FILES) $(PANDOC_PDF) -o $(TARGET_BOOK_FILE).pdf -M title="CSCI 1301 Book"
	
$(TARGET_BOOK_FILE).odt:  $(SOURCE_BOOK_FILES) | $(SOURCE_BOOK_FILES) $(BUILD_DIR)
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
	pandoc $(PANDOC_HTML_PAGES) $< -o $@ -M target_name=$(*F) -M source_name=$< -M path_to_root=$(subst $() ,,$(foreach v,$(subst /, ,$(subst $(BUILD_DIR),,$(dir $@))),../))
# Those two last variables are custom ones for pandoc, used in the html template to add download links
# to the pdf and odt versions, as well as a link to the original md source code.
# cf. https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html for an explanation of (@F).

#### Individual PDF files
$(BUILD_DIR)%.pdf: $(DOCS_DIR)%.md | $(BUILD_DIR)
	pandoc $(PANDOC_PDF) $< -o $@

#### Individual ODT files
$(BUILD_DIR)%.odt: $(DOCS_DIR)%.md | $(BUILD_DIR)
	pandoc $(PANDOC_ODT) $< -o $@

### Whole directories
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

web-index: | $(BUILD_DIR)
	pandoc $(WEB_INDEX) $(PANDOC_HTML_PAGES) -o $(BUILD_DIR)index.html -A $(WEBPATH)footer.html -M path_to_root=./
	pandoc $(404_PAGE) $(PANDOC_HTML_PAGES) -o $(BUILD_DIR)404.html -A $(WEBPATH)footer.html -M path_to_root=./

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
$(BUILD_DIR)$(LABS_DIR)%/index.html: $(LABS_DIR)%/readme.md | $(BUILD_DIR)
	mkdir -p $(dir $@)
	pandoc $(PANDOC_HTML_PAGES) $< -o $@ -M target_name=index -M source_name=$< -M path_to_root=$(subst $() ,,$(foreach v,$(subst /, ,$(subst $(BUILD_DIR),,$(dir $@))),../))
	
	# $(foreach var,$(apps),$(info In the loop running with make: $(var)))
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
	
#### Whole directories
# Compile all the labs in a specific format, by calling the previous corresponding rule for each file.
##### HTML
labs-html:$(SOURCE_LAB_INSTRUCTION_FILES) | $(BUILD_DIR)$(LABS_DIR)index.html $(BUILD_DIR)
	make $(TARGET_LAB_INSTRUCTION_FILES_HTML)

##### PDF
labs-pdf:$(SOURCE_LAB_INSTRUCTION_FILES) | $(BUILD_DIR)
	make $(TARGET_LAB_INSTRUCTION_FILES_PDF)
##### ODT
labs-odt:$(SOURCE_LAB_INSTRUCTION_FILES) | $(BUILD_DIR)
	make $(TARGET_LAB_INSTRUCTION_FILES_ODT)

#### Index page for labs
# I don't think we need odt / pdf for that page.
$(BUILD_DIR)$(LABS_DIR)index.html: $(LABS_DIR)*/readme.md | $(BUILD_DIR) $(BUILD_DIR)$(ARCHIVES)
	(cat $(LAB_TEMPLATES)labs.md && printf '\n' && \
		for dir in $(LABS_DIRS); do \
			printf ' | <a href="'$${dir}'/">'$${dir}'</a> | <a href="'$${dir}/index.pdf'">↓ pdf</a>, <a href="'$${dir}/index.odt'">↓ odt</a>, <a href="'$${dir}/index.html'">html</a> |' && 	\
			for fileA in */$${dir}/*.zip; do \
				test -f $${fileA} && printf '<a href="../'$${fileA}'">↓ '$$(basename $${fileA})'</a> '; \
			done;  \
		printf "| \n" ; done \
	) | pandoc -o $@ $(PANDOC_HTML_PAGES) -M path_to_root=$(subst $() ,,$(foreach v,$(subst /, ,$(subst $(BUILD_DIR),,$(dir $@))),../))

	
#### Whole labs instructions, in all formats.
labs-instructions: labs-html labs-pdf labs-odt

### Source Code

%.zip: src/%/*/Program.cs
#
# The structure of an archive is as follows:
# └───<Solution>	 	     $(notdir $*)
#      ├── <Solution.sln>	     $(dir $(patsubst %/,%,$(dir $<)))/$(notdir $*).sln
#      └── <Project>                 $(dir $<)
#           ├── <Project>.csproj     $(dir $<)$(notdir $(patsubst %/,%,$(dir $<))).csproj 
#           ├── Properties           $(dir $<)Properties 
#           │   └── AssemblyInfo.cs  $(dir $<)Properties/AssemblyInfo.cs
#           └── Program.cs           $<
#
# We will also use the following:
# $(notdir $*) # Name of Solution
# $(notdir $(patsubst %/,%,$(dir $<))) # Name of Project
# $@ # Name of target, the zip file
#
# We start by creating the required Properties directory:
	mkdir -p $(dir $<)Properties 
# We create the .sln file,
# The new lines have to be escaped with \n:
	(printf '\nMicrosoft Visual Studio Solution File, Format Version 12.00\n# Visual Studio 14\nVisualStudioVersion = 14.0.25420.1\nMinimumVisualStudioVersion = 10.0.40219.1\nProject("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "$(notdir $(patsubst %/,%,$(dir $<)))", "$(notdir $(patsubst %/,%,$(dir $<)))\$(notdir $(patsubst %/,%,$(dir $<))).csproj", "{C579075D-4630-47FA-9BE4-0E3E51DDFEA5}"\nEndProject\nGlobal\n	GlobalSection(SolutionConfigurationPlatforms) = preSolution\n		Debug|Any CPU = Debug|Any CPU\n		Release|Any CPU = Release|Any CPU\n	EndGlobalSection\n	GlobalSection(ProjectConfigurationPlatforms) = postSolution\n		{C579075D-4630-47FA-9BE4-0E3E51DDFEA5}.Debug|Any CPU.ActiveCfg = Debug|Any CPU\n		{C579075D-4630-47FA-9BE4-0E3E51DDFEA5}.Debug|Any CPU.Build.0 = Debug|Any CPU\n		{C579075D-4630-47FA-9BE4-0E3E51DDFEA5}.Release|Any CPU.ActiveCfg = Release|Any CPU\n		{C579075D-4630-47FA-9BE4-0E3E51DDFEA5}.Release|Any CPU.Build.0 = Release|Any CPU\n	EndGlobalSection\n	GlobalSection(SolutionProperties) = preSolution\n		HideSolutionNode = FALSE\n	EndGlobalSection\nEndGlobal\n') > $(dir $(patsubst %/,%,$(dir $<)))/$(notdir $*).sln
# We create the .csproj file.
# New lines are escaped as \n
# Single quotes are escaped as '\''
# $ are escaped as $$ (if they are *not* to be interepreted, i.e escape $(MSBuildToolsVersion) but not $(notdir $*)
# and \ are escaped as \\
	(printf '<?xml version="1.0" encoding="utf-8"?>\n<Project ToolsVersion="14.0" DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">\n  <Import Project="$$(MSBuildExtensionsPath)\$$(MSBuildToolsVersion)\Microsoft.Common.props" Condition="Exists('\''$$(MSBuildExtensionsPath)\$$(MSBuildToolsVersion)\Microsoft.Common.props'\'')" />\n  <PropertyGroup>\n    <StartAction>Project</StartAction>\n    <ExternalConsole>true</ExternalConsole>\n    <Configuration Condition=" '\''$$(Configuration)'\'' == '\'''\'' ">Debug</Configuration>\n    <Platform Condition=" '\''$$(Platform)'\'' == '\'''\'' ">AnyCPU</Platform>\n    <ProjectGuid>{C579075D-4630-47FA-9BE4-0E3E51DDFEA5}</ProjectGuid>\n    <OutputType>Exe</OutputType>\n    <AppDesignerFolder>Properties</AppDesignerFolder>\n    <RootNamespace>$(notdir $*)</RootNamespace>\n    <AssemblyName>$(notdir $*)</AssemblyName>\n    <TargetFrameworkVersion>v4.5.2</TargetFrameworkVersion>\n    <FileAlignment>512</FileAlignment>\n    <AutoGenerateBindingRedirects>true</AutoGenerateBindingRedirects>\n  </PropertyGroup>\n  <PropertyGroup Condition=" '\''$$(Configuration)|$$(Platform)'\'' == '\''Debug|AnyCPU'\'' ">\n    <PlatformTarget>AnyCPU</PlatformTarget>\n    <DebugSymbols>true</DebugSymbols>\n    <DebugType>full</DebugType>\n    <Optimize>false</Optimize>\n    <OutputPath>bin\Debug\</OutputPath>\n    <DefineConstants>DEBUG;TRACE</DefineConstants>\n    <ErrorReport>prompt</ErrorReport>\n    <WarningLevel>4</WarningLevel>\n  </PropertyGroup>\n  <PropertyGroup Condition=" '\''$$(Configuration)|$$(Platform)'\'' == '\''Release|AnyCPU'\'' ">\n    <PlatformTarget>AnyCPU</PlatformTarget>\n    <DebugType>pdbonly</DebugType>\n    <Optimize>true</Optimize>\n    <OutputPath>bin\Release\</OutputPath>\n    <DefineConstants>TRACE</DefineConstants>\n    <ErrorReport>prompt</ErrorReport>\n    <WarningLevel>4</WarningLevel>\n  </PropertyGroup>\n  <ItemGroup>\n    <Reference Include="System" />\n    <Reference Include="System.Core" />\n    <Reference Include="System.Xml.Linq" />\n    <Reference Include="System.Data.DataSetExtensions" />\n    <Reference Include="Microsoft.CSharp" />\n    <Reference Include="System.Data" />\n    <Reference Include="System.Net.Http" />\n    <Reference Include="System.Xml" />\n  </ItemGroup>\n  <ItemGroup>\n    <Compile Include="Program.cs" />\n    <Compile Include="Properties\AssemblyInfo.cs" />\n  </ItemGroup>\n  <Import Project="$$(MSBuildToolsPath)\Microsoft.CSharp.targets" />\n</Project>\n') > $(dir $<)$(notdir $(patsubst %/,%,$(dir $<))).csproj
# We create the Properties\AssemblyInfo.cs file.
	(printf 'using System.Reflection;\nusing System.Runtime.InteropServices;\n[assembly: AssemblyTitle("Welcome_Sol")]\n[assembly: AssemblyCompany("Augusta University")]\n[assembly: AssemblyCopyright("Copyright ©  2018")]\n[assembly: AssemblyVersion("1.0.0.0")]\n[assembly: AssemblyFileVersion("1.0.0.0")]\n') > $(dir $<)Properties/AssemblyInfo.cs
#
# TODO
# There needs to be one
# <ItemGroup>\n    <Compile Include="Program.cs" />\n  </ItemGroup>\n
# per .cs file in the project in the .csproj file.
# We can now only accomodate single-file projects.
#
# Finaly, we can zip the folder:
	cd $(dir $(patsubst %/,%,$(dir $<)))../ && 7z a ../$(notdir $@) $(notdir $*)*  -xr\!.vs -xr\!.directory
# We compress the folder containing the sln and the folder containing the csproj and the code
# But we excluse the .vs folder and .directory file
	

$(addprefix $(BUILD_DIR), $(ARCHIVES)): $(ARCHIVES)
# This rule concerns all the zip ARCHIVES, but prefixed by the BUILD_DIR 
	mkdir -p $(dir $@) 
	rsync -av $(subst $(BUILD_DIR),,$@) $@

labs: labs-instructions $(addprefix $(BUILD_DIR), $(ARCHIVES))

# -------------------------------
## Other Useful Rules
# -------------------------------

web: docs-html web-index $(TARGET_BOOK_FILE).html labs-html

build: docs web-index book labs

all: build
	7z a $(BUILD_DIR)release.zip $(BUILD_DIR)

# Phony rule to display variables
.PHONY: test
$(info $$var is [${ARCHIVES}])
