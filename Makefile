###################################################### 
# Welcome, source code reader!                       #
# In general, refer to                               #
# https://princomp.github.io/docs/about/user_guide   #
# for a complete documentation on how this resource  #
# is built and maintained.                           #
######################################################

# ===================================
# How to get help / read this file?
# ==================================

# -------------------------------
# Useful Makefile commands
# -------------------------------

# Display help message.
help:
	@echo "all - build everything"
	@echo "book - build books only (in all formats)"
	@echo "labs - build labs only"
	@echo "web - build html only, useful for testing web rendering"
	@echo "clean - remove generated build artifacts"

# Phony rule to display variables
.PHONY: test
# This rule is actually defined at the very end of this
# file, once all the variables have been declared 
# (it seems to make a difference, weirdly).
# Please, scroll to the end of this file to tweak it.

# Rule to clean 
.PHONY: clean
clean:
	@echo "cleaning build artifacts..."
	@rm -rf $(BUILD_DIR)

# Rule to tidy all C# source code, requires https://csharpier.com/
tidy:
	dotnet csharpier $(CODE_DIR)
	
# -------------------------------
# Useful Makefile doc. 
# -------------------------------
# - https://www.gnu.org/software/make/manual/html_node/File-Name-Functions.html
# - https://gist.github.com/rueycheng/42e355d1480fd7a33ee81c866c7fdf78
# - https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html
# - https://github.com/markpiffer/gmtt#call-wildcard-reclist-of-globs
# - https://devhints.io/makefile

# ===============================
# Options and variables
# ===============================

# -------------------------------
# Directories
# -------------------------------

# The folder where to build.
BUILD_DIR = content/
# The folder where the lectures are located.
LECTURES_DIR = lectures/
# The folder where the documentation is located.
DOCS_DIR = docs/
# The folder where the labs are located.
LABS_DIR = labs/
# The folder where the .cs code snippets and projects are located.
CODE_DIR = code/
# The folder where the .zip archives containing projects are located.
PROJECT_DIR = $(CODE_DIR)projects/
# The folders where .md files are located.
MD_DIRS = lectures/ docs/ labs/
# The folder where the images are located.
IMG_DIR = img/
# The folder where the videos are located.
VID_DIR = vid/
# The folders where the project are located.
PROJECTS_DIRS := $(shell find $(PROJECT_DIR) -maxdepth 1 -mindepth 1 -type d)

## Templates
TEMPLATES = templates/
# Path to PDF templates to use with pandoc
PDF_TEMPLATES = $(TEMPLATES)latex/
# Path to ODT templates to use with pandoc
ODT_TEMPLATES = $(TEMPLATES)odt/
# Path to DOCX templates to use with pandoc
DOC_TEMPLATES = $(TEMPLATES)docx/
# Path to the lua filters to use with pandoc
FIL_TEMPLATES = $(TEMPLATES)filters/


# -------------------------------
# Files
# -------------------------------

## md files
# We have two sources, one containing the index.md files,
# (including at root level), and one that doesn't.
SOURCE_MD_FILES := $(shell find $(MD_DIRS) -name '*.md')
SOURCE_MD_FILES += index.md
# md files without the index.md files in a folder.
# Those files only contain the title of the folder.
# cf. https://quartz.jzhao.xyz/authoring-content
SOURCE_MD_FILES_WITHOUT_INDEX = $(filter-out index.md %/index.md,$(SOURCE_MD_FILES))
# We construct two targets accordingly by prepending
# the BUILD_DIR folder.
TARGET_MD_FILES := $(addprefix $(BUILD_DIR), $(SOURCE_MD_FILES))
TARGET_MD_FILES_WITHOUT_INDEX := $(addprefix $(BUILD_DIR), $(SOURCE_MD_FILES_WITHOUT_INDEX))

## "Alternative formats" target files
# Every recipe is as follows:
# 1. Look at the TARGET_MD_FILES_WITHOUT_INDEX, (e.g. "lectures/arrays/1d.md")
# 2. Extract the name of the file without the extension using basename (e.g. "lectures/arrays/1d"),
# 3. Add the suffix (.odt, .pdf or .docx) (e.g. "lectures/arrays/1d.odt").
TARGET_PDF_FILES_WITHOUT_INDEX := $(addsuffix .pdf,  $(basename $(TARGET_MD_FILES_WITHOUT_INDEX)))
TARGET_ODT_FILES_WITHOUT_INDEX := $(addsuffix .odt,  $(basename $(TARGET_MD_FILES_WITHOUT_INDEX)))
TARGET_DOC_FILES_WITHOUT_INDEX := $(addsuffix .docx, $(basename $(TARGET_MD_FILES_WITHOUT_INDEX)))

# Font files (source and target).
SOURCE_WOFF_FONT_FILES := $(shell find templates/fonts/ -iname "*.woff*")
TARGET_WOFF_FONT_FILES := $(addprefix $(BUILD_DIR), $(patsubst templates/%,%,$(SOURCE_WOFF_FONT_FILES)))

# Image files (source and target).
SOURCE_IMAGES_FILES := $(shell find $(IMG_DIR) -mindepth 1  -maxdepth 1 -iname "*.jpg" -or -iname "*.jpeg" -or -iname "*.png" -or -iname "*.pdf" -or -iname "*.svg" -or -iname "*.gif")
TARGET_IMAGES_FILES := $(addprefix $(BUILD_DIR), $(SOURCE_IMAGES_FILES))

# Video files (source and target).
SOURCE_VIDEOS_FILES := $(shell find $(VID_DIR) -mindepth 1  -maxdepth 1 -iname "*.mov" -or -iname "*.avi" -or -iname "*.m4v" -or -iname "*.mkv")
TARGET_VIDEOS_FILES := $(addprefix $(BUILD_DIR), $(SOURCE_VIDEOS_FILES))

# Projects archives (only target).
TARGET_PROJECTS_FILES := $(addprefix $(BUILD_DIR), $(addsuffix .zip, $(PROJECTS_DIRS)))

# File where to get the metadata
METADATA_FILE = $(TEMPLATES)meta.yaml


# ===============================
# Options and variables
# ===============================

# -------------------------------
# Pandoc options
# -------------------------------

# The flags are explained at https://pandoc.org/MANUAL.html
# The only "custom" parts are:
# - the lua filter and the -M option that follows, that allows to have all code displayed as C# by default,
# - the -M date parameter, that sets date metadata to the last time the file was edited according to git.
# To use the current date / time instead, use:
# -M date="$$(LANG=en_us_88591 TZ='America/New_York' date '+%B  %e, %Y (%r)')" \

## Options for all output formats
PANDOC_OPTIONS = --filter pandoc-include -f markdown+emoji \
--strip-comments --email-obfuscation=references \
-M default-code-class=csharp \
-M date="$$(git log -1 --format=%cd --date=short -- $<)"

# Potentially, to have some kind of alternate callouts:
# --lua-filter templates/filters/callouts.lua

## MD build options
PANDOC_MD = $(PANDOC_OPTIONS) --standalone --lua-filter $(FIL_TEMPLATES)default-code-class-block.lua \
--shift-heading-level-by=-1 --to gfm+pipe_tables
# -s/--standalone is required to save the metadata block.

## Alternative formats options.

# Options common to all alternative format.
PANDOC_OPTIONS_ALT = --lua-filter $(FIL_TEMPLATES)default-code-class-block-inline.lua

# PDF build options
PANDOC_PDF:= $(PANDOC_OPTIONS_ALT) --toc -V links-as-notes --default-image-extension=pdf --pdf-engine=xelatex --include-in-header=$(PDF_TEMPLATES)header.tex

# ODT build options
PANDOC_ODT:= $(PANDOC_OPTIONS_ALT) --default-image-extension=svg --reference-doc=$(ODT_TEMPLATES)custom-reference.odt

# DOCX build options
PANDOC_DOC:= $(PANDOC_OPTIONS_ALT) --default-image-extension=svg 
# --reference-doc=$(DOCX_TEMPLATES)custom-reference.docx

# Remember to add ?
# --metadata-file=$(METADATA_FILE)
# documentclass: scrartcl  # templating
# numbersections: true     # templating
# papersize: letter        # templating
# geometry: margin=1in     # templating
# to pandoc's options for pdf, odt, docx (not sure about the use for the last four for docx / odt)

# ===============================
# Rules
# ===============================

# -------------------------------
# Performance & Global Options
# -------------------------------

# Maximize parallel execution whenever possible
.PHONY:MAKEFLAGS
MAKEFLAGS:= -j

# By default, we construct all the files.
.DEFAULT_GOAL:= all

# -------------------------------
# Order file
# -------------------------------

# This part of the Makefile consider the order in the ./order file to
# construct the "web-order.ts" file, that determine the order used
# in the menu on the website.

# To get a clean list of all the .md files, use something along the lines of
# tree -f -P "*.md" --prune | sed 's/.*├──//g' | sed 's/.*│//g' | sed 's/.*└──//g' | sed 's/.*index\.md//g'  | sed -r '/^\s*$/d'

# The regular expression 
# 's-.*/(.*)/$$-\1-g'
# goes from e.g.,
# ./lectures/misc/
# to 
# misc
# and the regular expression
# 's-\./(.*)\.md$$-\1-g'
# goes from e.g.,
# ./lectures/intro/inputs_and_outputs.md
# to 
# lectures/intro/inputs_and_outputs
# which *seems* to be the way quartz's 
# explorer routine explained at 
# https://quartz.jzhao.xyz/features/explorer
# process.
# Refer to sortFn.ts and web-order.ts
# in the quartz branch for more info
web-order.ts: order
	@echo -n "// This file was generated automatically by calling make web-order.ts.\n// Refer to the Makefile to read indications on how to generate and edit it.\nexport const nameOrderMap: Record<string, number> = {\n" > $@
	@n=0 ;
	@while read -r line; do \
	n=$$((n+1)); \
	echo -n '\t"' >> $@;\
	echo -n "$$line" | sed -E 's-.*/(.*)/$$-\1-g' | sed -E 's-\./(.*)\.md$$-\1-g' >> $@;\
	echo -n "\": $$n,\n"  >> $@ ;\
	done < order
	@echo "}" >> $@

# -------------------------------
# md file
# -------------------------------

$(BUILD_DIR)%.md: %.md
	@mkdir -p $(dir $@)
	@pandoc $(PANDOC_MD) $< -o $@
	
# -------------------------------
# docx files
# -------------------------------

$(BUILD_DIR)%.docx: %.md
	@mkdir -p $(dir $@)
	@pandoc $(PANDOC_DOC) $< -o $@

# -------------------------------
# pdf files
# -------------------------------

$(BUILD_DIR)%.pdf: %.md
	@mkdir -p $(dir $@)
	@pandoc $(PANDOC_PDF) $< -o $@

# -------------------------------
# image file
# -------------------------------

# Individual images:
$(BUILD_DIR)$(IMG_DIR)%: $(IMG_DIR)%
	@mkdir -p $(dir $@)
	@rsync -av $<  $@

# -------------------------------
# video file
# -------------------------------	

# Individual videos:
$(BUILD_DIR)$(VID_DIR)%: $(VID_DIR)%
	@mkdir -p $(dir $@)
	@rsync -av $< $@

# -------------------------------
# font files
# -------------------------------
	
# Individual woff font files:
$(BUILD_DIR)fonts/%.woff : templates/fonts/%.woff
	@mkdir -p $(dir $@)
	@rsync -av $< $@
	
# Individual woff2 font files:
$(BUILD_DIR)fonts/%.woff2 : templates/fonts/%.woff2
	@mkdir -p $(dir $@)
	@rsync -av $< $@

# -------------------------------
# project (zip) files
# -------------------------------

# Rule to copy one individual project as a zip file:
$(BUILD_DIR)$(PROJECT_DIR)%.zip: $(PROJECT_DIR)%.zip
	mkdir -p $(dir $@) 
	rsync -av $(subst $(BUILD_DIR),,$@) $@

# Rule to create one individual project and zip it:
# The code below is taken from and documented at 
# https://github.com/csci-1301/C-Sharp-project-maker
$(PROJECT_DIR)%.zip: $(PROJECT_DIR)%/*/Program.cs | $(PROJECT_DIR)/%/*/*.cs
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
	(printf '\nMicrosoft Visual Studio Solution File, Format Version 12.00\n# Visual Studio 14\nVisualStudioVersion = 14.0.25420.1\nMinimumVisualStudioVersion = 10.0.40219.1\nProject("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "$(notdir $(patsubst %/,%,$(dir $<)))", "$(notdir $(patsubst %/,%,$(dir $<)))\\$(notdir $(patsubst %/,%,$(dir $<))).csproj", "{C579075D-4630-47FA-9BE4-0E3E51DDFEA5}"\nEndProject\nGlobal\n	GlobalSection(SolutionConfigurationPlatforms) = preSolution\n		Debug|Any CPU = Debug|Any CPU\n		Release|Any CPU = Release|Any CPU\n	EndGlobalSection\n	GlobalSection(ProjectConfigurationPlatforms) = postSolution\n		{C579075D-4630-47FA-9BE4-0E3E51DDFEA5}.Debug|Any CPU.ActiveCfg = Debug|Any CPU\n		{C579075D-4630-47FA-9BE4-0E3E51DDFEA5}.Debug|Any CPU.Build.0 = Debug|Any CPU\n		{C579075D-4630-47FA-9BE4-0E3E51DDFEA5}.Release|Any CPU.ActiveCfg = Release|Any CPU\n		{C579075D-4630-47FA-9BE4-0E3E51DDFEA5}.Release|Any CPU.Build.0 = Release|Any CPU\n	EndGlobalSection\n	GlobalSection(SolutionProperties) = preSolution\n		HideSolutionNode = FALSE\n	EndGlobalSection\nEndGlobal\n') > $(dir $(patsubst %/,%,$(dir $<)))/$(notdir $*).sln
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
	@(printf '<?xml version="1.0" encoding="utf-8"?>\n<Project ToolsVersion="14.0" DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/mscontent/2003">\n  <Import Project="$$(MSBuildExtensionsPath)\$$(MSBuildToolsVersion)\Microsoft.Common.props" Condition="Exists('\''$$(MSBuildExtensionsPath)\$$(MSBuildToolsVersion)\Microsoft.Common.props'\'')" />\n  <PropertyGroup>\n\t<StartAction>Project</StartAction>\n\t<ExternalConsole>true</ExternalConsole>\n\t<Configuration Condition=" '\''$$(Configuration)'\'' == '\'''\'' ">Debug</Configuration>\n\t<Platform Condition=" '\''$$(Platform)'\'' == '\'''\'' ">AnyCPU</Platform>\n\t<ProjectGuid>{C579075D-4630-47FA-9BE4-0E3E51DDFEA5}</ProjectGuid>\n\t<OutputType>Exe</OutputType>\n\t<AppDesignerFolder>Properties</AppDesignerFolder>\n\t<RootNamespace>$(notdir $*)</RootNamespace>\n\t<AssemblyName>$(notdir $*)</AssemblyName>\n\t<TargetFrameworkVersion>v4.5.2</TargetFrameworkVersion>\n\t<FileAlignment>512</FileAlignment>\n\t<AutoGenerateBindingRedirects>true</AutoGenerateBindingRedirects>\n  </PropertyGroup>\n  <PropertyGroup Condition=" '\''$$(Configuration)|$$(Platform)'\'' == '\''Debug|AnyCPU'\'' ">\n\t<PlatformTarget>AnyCPU</PlatformTarget>\n\t<DebugSymbols>true</DebugSymbols>\n\t<DebugType>full</DebugType>\n\t<Optimize>false</Optimize>\n\t<OutputPath>bin\Debug\</OutputPath>\n\t<DefineConstants>DEBUG;TRACE</DefineConstants>\n\t<ErrorReport>prompt</ErrorReport>\n\t<WarningLevel>4</WarningLevel>\n  </PropertyGroup>\n  <PropertyGroup Condition=" '\''$$(Configuration)|$$(Platform)'\'' == '\''Release|AnyCPU'\'' ">\n\t<PlatformTarget>AnyCPU</PlatformTarget>\n\t<DebugType>pdbonly</DebugType>\n\t<Optimize>true</Optimize>\n\t<OutputPath>bin\Release\</OutputPath>\n\t<DefineConstants>TRACE</DefineConstants>\n\t<ErrorReport>prompt</ErrorReport>\n\t<WarningLevel>4</WarningLevel>\n  </PropertyGroup>\n  <PropertyGroup>\n\t<StartupObject>\n\t\t') > $(dir $<)$(notdir $(patsubst %/,%,$(dir $<))).csproj; \
	# The following grep the name of the class in Program.cs,
	# following the official syntax given at 
	# https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/language-specification/classes#1521-general
	# class_declaration
	#    : attributes? class_modifier* 'partial'? 'class' identifier
	#        type_parameter_list? class_base? type_parameter_constraints_clause*
	#        class_body ';'?
	#    ;
	# Inspired by the regular expression given at 
	# https://stackoverflow.com/a/19858777
	@grep -oP '(((internal)|(public)|(private)|(protected)|(sealed)|(abstract)|(static))?[\s\r\n\t]+){0,2}class[\s]+\K([[:alnum:]]|_)*[\s\S]' $(dir $<)/Program.cs >> $(dir $<)$(notdir $(patsubst %/,%,$(dir $<))).csproj \
	&& (printf '\t</StartupObject>\n  </PropertyGroup>\n\t<ItemGroup>\n\t<Reference Include="System" />\n\t<Reference Include="System.Core" />\n\t<Reference Include="System.Xml.Linq" />\n\t<Reference Include="System.Data.DataSetExtensions" />\n\t<Reference Include="Microsoft.CSharp" />\n\t<Reference Include="System.Data" />\n\t<Reference Include="System.Net.Http" />\n\t<Reference Include="System.Xml" />\n  </ItemGroup>\n  <ItemGroup>\n') >> $(dir $<)$(notdir $(patsubst %/,%,$(dir $<))).csproj \
	&& for fileA in $(dir $<)*.cs; do \
	printf '\t<Compile Include="'$$(basename $${fileA})'" />\n' >> $(dir $<)$(notdir $(patsubst %/,%,$(dir $<))).csproj ; \
	done;  \
	(printf  '\t<Compile Include="Properties\AssemblyInfo.cs" />\n  </ItemGroup>\n  <Import Project="$$(MSBuildToolsPath)\Microsoft.CSharp.targets" />\n</Project>\n') >> $(dir $<)$(notdir $(patsubst %/,%,$(dir $<))).csproj \
	# We create the Properties\AssemblyInfo.cs file.
	(printf 'using System.Reflection;\nusing System.Runtime.InteropServices;\n[assembly: AssemblyTitle("'$$(notdir $*)'=")]\n[assembly: AssemblyCompany("Augusta University")]\n[assembly: AssemblyCopyright("Copyright ©  2018")]\n[assembly: AssemblyVersion("1.0.0.0")]\n[assembly: AssemblyFileVersion("1.0.0.0")]\n') > $(dir $<)Properties/AssemblyInfo.cs
	# Finally, we can zip the folder:
	cd $(dir $(patsubst %/,%,$(dir $<)))../ && 7z a $(notdir $@) $(notdir $*)*  -xr\!.vs -xr\!.directory
	# We compress the folder containing the sln and the folder containing the csproj and the code
	# But we exclude the .vs folder and .directory file

	# -------------------------------
	## Book
	# -------------------------------

#test:
#	pandoc $(shell cat order | grep -E "./lectures/.*.md|./docs/.*md") -o test.html 


###
# Source / Project
###
	
	

#deploy:
#	git checkout quartz-migration
#	npx quartz build --serve --concurrency 8	


all: web-order.ts $(TARGET_MD_FILES) $(TARGET_WOFF_FONT_FILES) $(TARGET_IMAGES_FILES) $(TARGET_VIDEOS_FILES) $(TARGET_DOC_FILES_WITHOUT_INDEX) $(TARGET_PROJECTS_FILES) 

# Phony rule to display variables
# Uncomment the following and replace
# PROJECT_DIR
# with the variable you want listed.
#test:
#	$(info $$PROJECT_DIR is [${PROJECT_DIR}])
test:	
	$(info $$TARGET_MD_FILES is [${TARGET_DOC_FILES_WITHOUT_INDEX}])

