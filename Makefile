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
LABS_DIRS:= $(notdir $(shell find $(LABS_DIR) -mindepth 1  -maxdepth 1  -type d | sort))

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
# 5. Add the prefix "docs" (e.g. "docs/about.html").
# 6. Add the prefix "build" (e.g. "build/docs/about.html").
# This allows to automatically build the list of targets (the build/html files)
# from the list of md files in docs.

TARGET_DOC_FILES_PDF := $(addprefix $(BUILD_DIR), $(addsuffix .pdf, $(basename $(notdir $(SOURCE_DOC_FILES)))))
# Similar to TARGET_DOC_FILES_HTML, but with pdf.

TARGET_DOC_FILES_ODT := $(addprefix $(BUILD_DIR), $(addsuffix .odt, $(basename $(notdir $(SOURCE_DOC_FILES)))))
# Similar to TARGET_DOC_FILES_HTML, but with odt.

TARGET_DOC_FILES_DOCX := $(addprefix $(BUILD_DIR), $(addsuffix .docx, $(basename $(notdir $(SOURCE_DOC_FILES)))))
# Similar to TARGET_DOC_FILES_HTML, but with docx.


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

TARGET_LAB_INSTRUCTION_FILES_DOCX := $(addprefix $(BUILD_DIR), $(addsuffix index.docx, $(dir $(SOURCE_LAB_INSTRUCTION_FILES))))
# Similar to TARGET_LAB_INSTRUCTION_FILES_HTML, but with docx.

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

### Image files

SOURCE_IMAGES_FILES := $(shell find img/ -mindepth 1  -maxdepth 1 -iname "*.jpg" -or -iname "*.jpeg" -or -iname "*.png" -or -iname "*.pdf" -or -iname "*.svg" -or -iname "*.gif")

TARGET_IMAGES_FILES := $(addprefix $(BUILD_DIR), $(SOURCE_IMAGES_FILES))

### Video files

SOURCE_VIDEOS_FILES := $(shell find vid/ -mindepth 1  -maxdepth 1 -iname "*.mov" -or -iname "*.avi" -or -iname "*.m4v")

TARGET_VIDEOS_FILES := $(addprefix $(BUILD_DIR), $(SOURCE_VIDEOS_FILES))

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

# The flags are explained at https://pandoc.org/MANUAL.html
# The only "custom" parts are:
# - the lua filter and the -M option that follows, that allows to have all code displayed as C# by default,
# - the -M date parameter, that sets the timezone and language to avoid inconsistencies across systems,

# Options for all output formats
PANDOC_OPTIONS = --toc --section-divs --filter pandoc-include -f markdown+emoji \
	--lua-filter templates/filters/default-code-class.lua -M default-code-class=csharp \
	-M date="$$(LANG=en_us_88591 TZ='America/New_York' date '+%B  %e, %Y (%r)')" \
        --metadata-file=$(METADATA_FILE)  --email-obfuscation=references
	
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

# DOCX build options
PANDOC_DOCX:= $(PANDOC_OPTIONS) --default-image-extension=svg 

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
	
# Individual images:
$(BUILD_DIR)img/%: img/%
	rsync -av $<  $@

# Every images:
build/img: $(SOURCE_IMAGES_FILES)
	mkdir -p $(BUILD_DIR)img/
	make $(TARGET_IMAGES_FILES)

# Individual videos:
$(BUILD_DIR)vid/%: vid/%
	rsync -av $< $@

# Every videos:
build/vid: $(SOURCE_VIDEOS_FILES)
	mkdir -p $(BUILD_DIR)vid/
	make $(TARGET_VIDEOS_FILES)
	
$(BUILD_DIR) $(BUILD_DIR)$(LABS_DIR): | build/img build/vid
	@echo "starting build..."
	mkdir -p $(BUILD_DIR)$(LABS_DIR)
	rsync -av img/favicon/* $(BUILD_DIR)
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
	pandoc $(SOURCE_BOOK_FILES) $(PANDOC_PDF) -o $@ -M title="CSCI 1301 Book"
	
$(TARGET_BOOK_FILE).odt:  $(SOURCE_BOOK_FILES) | $(SOURCE_BOOK_FILES) $(BUILD_DIR)
	pandoc $(SOURCE_BOOK_FILES) $(PANDOC_ODT) -o $@ -M title="CSCI 1301 Book"

$(TARGET_BOOK_FILE).docx:  $(SOURCE_BOOK_FILES) | $(SOURCE_BOOK_FILES) $(BUILD_DIR)
	pandoc $(SOURCE_BOOK_FILES) $(PANDOC_DOCX) -o $@ -M title="CSCI 1301 Book"

$(TARGET_BOOK_FILE).epub:  $(SOURCE_BOOK_FILES) | $(SOURCE_BOOK_FILES) $(BUILD_DIR)
	pandoc $(SOURCE_BOOK_FILES) $(PANDOC_DOCX) -o $@ -M title="CSCI 1301 Book"

# Whole book, in all formats.
book: $(TARGET_BOOK_FILE).html $(TARGET_BOOK_FILE).pdf $(TARGET_BOOK_FILE).odt $(TARGET_BOOK_FILE).docx $(TARGET_BOOK_FILE).epub

# -------------------------------
## Documentation Files
# -------------------------------


### Exercises without solution
$(DOCS_DIR)exercises.md:$(DOCS_DIR)exercises_with_solutions.md
	sed '/<details/,/<\/details>/d' $< > $@ 
	sed -i 's/title: Exercises with solutions/title : Exercises/g' $@
	sed -i '1s/^/<!--\n\n DO NOT EDIT THIS FILE\n\n Edit docs\/exercises_with_solutions.md instead, and run\n \"make docs\/exercises.md"\n instead.\n -->\n/' $@

### Individual files
# Can be used to compile doc files individually e.g.
# make build/docs/about.html
#### Individual HTML files.
$(BUILD_DIR)%.html: $(DOCS_DIR)%.md | $(BUILD_DIR)
	mkdir -p $(dir $@)
	pandoc $(PANDOC_HTML_PAGES) $< -o $@ -M target_name=$(*F) -M source_name=$< -M path_to_root=$(subst $() ,,$(foreach v,$(subst /, ,$(subst $(BUILD_DIR),,$(dir $@))),../))
# Those two last variables are custom ones for pandoc, used in the html template to add download links
# to the pdf and odt versions, as well as a link to the original md source code.
# cf. https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html for an explanation of (@F).

#### Individual PDF files
$(BUILD_DIR)%.pdf: $(DOCS_DIR)%.md | $(BUILD_DIR)
	mkdir -p $(dir $@)
	pandoc $(PANDOC_PDF) $< -o $@

#### Individual ODT files
$(BUILD_DIR)%.odt: $(DOCS_DIR)%.md | $(BUILD_DIR)
	mkdir -p $(dir $@)
	pandoc $(PANDOC_ODT) $< -o $@

#### Individual DOCX files
$(BUILD_DIR)%.docx: $(DOCS_DIR)%.md | $(BUILD_DIR)
	mkdir -p $(dir $@)
	pandoc $(PANDOC_DOCX) $< -o $@
	
### Whole directories
# Compile all the documentation in a specific format, by calling the previous corresponding rule for each file.
#### HTML
docs-html:$(SOURCE_DOC_FILES) $(DOCS_DIR)exercises.md
	make $(TARGET_DOC_FILES_HTML)
#### PDF
docs-pdf:$(SOURCE_DOC_FILES) $(DOCS_DIR)exercises.md
	make $(TARGET_DOC_FILES_PDF)
#### ODT
docs-odt:$(SOURCE_DOC_FILES) $(DOCS_DIR)exercises.md
	make $(TARGET_DOC_FILES_ODT)
#### DOCX
docs-docx:$(SOURCE_DOC_FILES) $(DOCS_DIR)exercises.md
	make $(TARGET_DOC_FILES_DOCX)
	
### Whole doc, in all formats.
docs: docs-html docs-pdf docs-odt docs-docx

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
	pandoc $(PANDOC_PDF) -f markdown+rebase_relative_paths $< -o $@ 
# The "-f markdown+rebase_relative_paths" option is needed to have the links
# to images behave nicely.
	
##### Individual ODT files.
$(BUILD_DIR)$(LABS_DIR)%/index.odt: $(LABS_DIR)%/readme.md
	mkdir -p $(dir $@)
	pandoc $(PANDOC_ODT) -f markdown+rebase_relative_paths $< -o $@ 

##### Individual DOCX files.
$(BUILD_DIR)$(LABS_DIR)%/index.docx: $(LABS_DIR)%/readme.md
	mkdir -p $(dir $@)
	pandoc $(PANDOC_DOCX) -f markdown+rebase_relative_paths $< -o $@ 

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

##### DOCX
labs-docx:$(SOURCE_LAB_INSTRUCTION_FILES) | $(BUILD_DIR)
	make $(TARGET_LAB_INSTRUCTION_FILES_DOCX)

#### Index page for labs
# I don't think we need odt / pdf for that page.
$(BUILD_DIR)$(LABS_DIR)index.html: $(LABS_DIR)*/readme.md | $(BUILD_DIR) $(addprefix $(BUILD_DIR), $(ARCHIVES))
	(cat $(LAB_TEMPLATES)labs.md && printf '\n' && \
		for dir in $(LABS_DIRS); do \
			printf ' | <a href="'$${dir}'/">'$${dir}'</a> | <a href="'$${dir}/index.pdf'">↓ pdf</a>, <a href="'$${dir}/index.odt'">↓ odt</a>, <a href="'$${dir}/index.docx'">↓ docx</a>, <a href="'$${dir}/index.html'">↓ html</a> |' && 	\
			for fileA in */$${dir}/*.zip; do \
				test -f $${fileA} && printf '<a href="../'$${fileA}'">↓ '$$(basename $${fileA})'</a> '; \
			done;  \
		printf "| \n" ; done \
	) | pandoc -o $@ $(PANDOC_HTML_PAGES) -M path_to_root=$(subst $() ,,$(foreach v,$(subst /, ,$(subst $(BUILD_DIR),,$(dir $@))),../))

	
#### Whole labs instructions, in all formats.
labs-instructions: labs-html labs-pdf labs-odt labs-docx

### Source Code

%.zip: src/%/*/Program.cs | src/%/*/*.cs
#
# The structure of an archive is as follows:
# └───<Solution>	 	     $(notdir $*)
#      ├── <Solution.sln>	     $(dir $(patsubst %/,%,$(dir $<)))/$(notdir $*).sln
#      └── <Project>                 $(dir $<)
#           ├── <Project>.csproj     $(dir $<)$(notdir $(patsubst %/,%,$(dir $<))).csproj 
#           ├── Properties           $(dir $<)Properties 
#           │   └── AssemblyInfo.cs  $(dir $<)Properties/AssemblyInfo.cs
#           ├── Program.cs           $<
#	    └── <Class>.cs	     
# We will also use the following:
# $(notdir $*) # Name of Solution
# $(notdir $(patsubst %/,%,$(dir $<))) # Name of Project
# $@ # Name of target, the zip file
# cat $< | grep -oP '^\s*(public |private )?class \K.*' # name of the class in Program.cs
#
# We start by creating the required Properties directory:
	mkdir -p $(dir $<)Properties 
# We create the .sln file,
# The new lines have to be escaped with \n:
	(printf '\nMicrosoft Visual Studio Solution File, Format Version 12.00\n# Visual Studio 14\nVisualStudioVersion = 14.0.25420.1\nMinimumVisualStudioVersion = 10.0.40219.1\nProject("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "$(notdir $(patsubst %/,%,$(dir $<)))", "$(notdir $(patsubst %/,%,$(dir $<)))\$(notdir $(patsubst %/,%,$(dir $<))).csproj", "{C579075D-4630-47FA-9BE4-0E3E51DDFEA5}"\nEndProject\nGlobal\n	GlobalSection(SolutionConfigurationPlatforms) = preSolution\n		Debug|Any CPU = Debug|Any CPU\n		Release|Any CPU = Release|Any CPU\n	EndGlobalSection\n	GlobalSection(ProjectConfigurationPlatforms) = postSolution\n		{C579075D-4630-47FA-9BE4-0E3E51DDFEA5}.Debug|Any CPU.ActiveCfg = Debug|Any CPU\n		{C579075D-4630-47FA-9BE4-0E3E51DDFEA5}.Debug|Any CPU.Build.0 = Debug|Any CPU\n		{C579075D-4630-47FA-9BE4-0E3E51DDFEA5}.Release|Any CPU.ActiveCfg = Release|Any CPU\n		{C579075D-4630-47FA-9BE4-0E3E51DDFEA5}.Release|Any CPU.Build.0 = Release|Any CPU\n	EndGlobalSection\n	GlobalSection(SolutionProperties) = preSolution\n		HideSolutionNode = FALSE\n	EndGlobalSection\nEndGlobal\n') > $(dir $(patsubst %/,%,$(dir $<)))/$(notdir $*).sln
# We create the .csproj file.
# New lines are escaped as \n
# Single quotes are escaped as '\''
# $ are escaped as $$ (if they are *not* to be interpreted, i.e escape $(MSBuildToolsVersion) but not $(notdir $*)
# and \ are escaped as \\
# The additional difficulty is that we want the csproj to include all the .cs files in the <Solution> folder
# (so, not only the Program.cs, but also possible (multiple) <Class>.cs).
# We create the part in five parts: 
#     1. The initial set-up,
#     2. We insert the name of the class in Program.cs to be the default startup object,
#     3. We continue with the standard template of the file,
#     4. Then, we append "<Compile Include="<name of the cs file>" />" for each cs file in the <Solution> folder,
#     5. Finally, we append the required closing to the file.
# Apparently, another way would be to use wildcards (cf. https://stackoverflow.com/a/9438419)

	(printf '<?xml version="1.0" encoding="utf-8"?>\n<Project ToolsVersion="14.0" DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">\n  <Import Project="$$(MSBuildExtensionsPath)\$$(MSBuildToolsVersion)\Microsoft.Common.props" Condition="Exists('\''$$(MSBuildExtensionsPath)\$$(MSBuildToolsVersion)\Microsoft.Common.props'\'')" />\n  <PropertyGroup>\n\t<StartAction>Project</StartAction>\n\t<ExternalConsole>true</ExternalConsole>\n\t<Configuration Condition=" '\''$$(Configuration)'\'' == '\'''\'' ">Debug</Configuration>\n\t<Platform Condition=" '\''$$(Platform)'\'' == '\'''\'' ">AnyCPU</Platform>\n\t<ProjectGuid>{C579075D-4630-47FA-9BE4-0E3E51DDFEA5}</ProjectGuid>\n\t<OutputType>Exe</OutputType>\n\t<AppDesignerFolder>Properties</AppDesignerFolder>\n\t<RootNamespace>$(notdir $*)</RootNamespace>\n\t<AssemblyName>$(notdir $*)</AssemblyName>\n\t<TargetFrameworkVersion>v4.5.2</TargetFrameworkVersion>\n\t<FileAlignment>512</FileAlignment>\n\t<AutoGenerateBindingRedirects>true</AutoGenerateBindingRedirects>\n  </PropertyGroup>\n  <PropertyGroup Condition=" '\''$$(Configuration)|$$(Platform)'\'' == '\''Debug|AnyCPU'\'' ">\n\t<PlatformTarget>AnyCPU</PlatformTarget>\n\t<DebugSymbols>true</DebugSymbols>\n\t<DebugType>full</DebugType>\n\t<Optimize>false</Optimize>\n\t<OutputPath>bin\Debug\</OutputPath>\n\t<DefineConstants>DEBUG;TRACE</DefineConstants>\n\t<ErrorReport>prompt</ErrorReport>\n\t<WarningLevel>4</WarningLevel>\n  </PropertyGroup>\n  <PropertyGroup Condition=" '\''$$(Configuration)|$$(Platform)'\'' == '\''Release|AnyCPU'\'' ">\n\t<PlatformTarget>AnyCPU</PlatformTarget>\n\t<DebugType>pdbonly</DebugType>\n\t<Optimize>true</Optimize>\n\t<OutputPath>bin\Release\</OutputPath>\n\t<DefineConstants>TRACE</DefineConstants>\n\t<ErrorReport>prompt</ErrorReport>\n\t<WarningLevel>4</WarningLevel>\n  </PropertyGroup>\n  <PropertyGroup>\n\t<StartupObject>\n\t\t') > $(dir $<)$(notdir $(patsubst %/,%,$(dir $<))).csproj; \
	(cat $< | grep -oP '^\s*(public |private )?class \K.*') >> $(dir $<)$(notdir $(patsubst %/,%,$(dir $<))).csproj \
	&& (printf '\t</StartupObject>\n  </PropertyGroup>\n\t<ItemGroup>\n\t<Reference Include="System" />\n\t<Reference Include="System.Core" />\n\t<Reference Include="System.Xml.Linq" />\n\t<Reference Include="System.Data.DataSetExtensions" />\n\t<Reference Include="Microsoft.CSharp" />\n\t<Reference Include="System.Data" />\n\t<Reference Include="System.Net.Http" />\n\t<Reference Include="System.Xml" />\n  </ItemGroup>\n  <ItemGroup>\n') >> $(dir $<)$(notdir $(patsubst %/,%,$(dir $<))).csproj \
	&& for fileA in $(dir $<)*.cs; do \
				printf '\t<Compile Include="'$$(basename $${fileA})'" />\n' >> $(dir $<)$(notdir $(patsubst %/,%,$(dir $<))).csproj ; \
			done;  \
	(printf  '\t<Compile Include="Properties\AssemblyInfo.cs" />\n  </ItemGroup>\n  <Import Project="$$(MSBuildToolsPath)\Microsoft.CSharp.targets" />\n</Project>\n') >> $(dir $<)$(notdir $(patsubst %/,%,$(dir $<))).csproj \
# We create the Properties\AssemblyInfo.cs file.
	(printf 'using System.Reflection;\nusing System.Runtime.InteropServices;\n[assembly: AssemblyTitle("'$$(notdir $*)'=")]\n[assembly: AssemblyCompany("Augusta University")]\n[assembly: AssemblyCopyright("Copyright ©  2018")]\n[assembly: AssemblyVersion("1.0.0.0")]\n[assembly: AssemblyFileVersion("1.0.0.0")]\n') > $(dir $<)Properties/AssemblyInfo.cs
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
# But we exclude the .vs folder and .directory file
	

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
$(info $$var is [${TARGET_DOC_FILES_HTML}])
