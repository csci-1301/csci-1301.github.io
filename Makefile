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
CODE_DIR = code/
PROJECT_DIR = $(CODE_DIR)projects/
LAB_TEMPLATES= templates/labs/
LABS_DIRS:= $(notdir $(shell find $(LABS_DIR) -mindepth 1  -maxdepth 1  -type d | sort))


SOURCE_MD_FILES := $(shell find lectures/ docs/ labs/ . -name '*.md')
TARGET_MD_FILES = $(addprefix $(BUILD_DIR), $(SOURCE_MD_FILES))

METADATA_FILE = templates/meta.yaml

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

# Options for all output formats
PANDOC_OPTIONS = --section-divs --filter pandoc-include -f markdown+emoji \
-M default-code-class=csharp \
-M date="$$(git log -1 --format=%cd --date=short -- $<)" \
--strip-comments --email-obfuscation=references --metadata-file=$(METADATA_FILE)

# Potentially, to have some kind of alternate callouts:
# --lua-filter templates/filters/callouts.lua

# We use the for the date the last time the file was edited according to git.
# To use the current date / time instead, use:
#-M date="$$(LANG=en_us_88591 TZ='America/New_York' date '+%B  %e, %Y (%r)')" \


# MD build options
PANDOC_MD = $(PANDOC_OPTIONS) --standalone --lua-filter templates/filters/default-code-class-block.lua --shift-heading-level-by=-1 --to gfm+pipe_tables
# -s/--standalone is required to save the metadata block.


# Remember to add
# --toc --lua-filter templates/filters/default-code-class-block-inline.lua
#
# documentclass: scrartcl  # templating
# numbersections: true     # templating
# papersize: letter        # templating
# geometry: margin=1in     # templating
# to pandoc's options for pdf, odt, docx (not sure about the use for the last four for docx / odt)

$(BUILD_DIR)%.md: %.md
	@mkdir -p $(dir $@)
	pandoc $(PANDOC_MD) $< -o $@

WOFF_FONT_FILES := $(shell find templates/fonts/ -iname "*.woff*")
TARGET_WOFF_FONT_FILES := $(addprefix $(BUILD_DIR), $(patsubst templates/%,%,$(WOFF_FONT_FILES)))

# Individual woff font files:
$(BUILD_DIR)fonts/%.woff : templates/fonts/%.woff
	mkdir -p $(dir $@)
	rsync -av $< $@
	
# Individual woff2 font files:
$(BUILD_DIR)fonts/%.woff2 : templates/fonts/%.woff2
	mkdir -p $(dir $@)
	rsync -av $< $@


###############################################
# Order: this part of the Makefile consider   #
# the order in the ./order file to            #
# 1. Construct the "web-order.ts" file, that  #
#    determine the order used in the menu on  #
#    the website.                             #
# 2. Determine in which order pandoc needs    #
#    
################

# The following rule is needed to construct the order 
# in the menu on the website, and the order used to integrate the notes.

# To obtain and update the order file, use something along the lines of 
# tree -f -P "*.md" --prune | sed 's/.*├──//g' | sed 's/.*│//g' | sed 's/.*└──//g' | sed 's/.*index\.md//g'  | sed -r '/^\s*$/d'

# Order for website
# The regular expression 
# 's-([^/]*/)*((.)*)$$-\2-g'
# goes from e.g.,
# ./lectures/misc/over_under_flow.md
# to 
# over_under_flow
# and from e.g.,
# ./docs/academic_life
# to 
# academic_life
# Note that we keep the *second* capture group.
web-order.ts: order
	@echo -n "// This file was generated automatically by calling make web-order.ts.\n// Refer to the Makefile to read indications on how to generate and edit it.\nexport const nameOrderMap: Record<string, number> = {\n" > $@
	@n=0 ;
	@while read -r line; do \
		n=$$((n+1)); \
		echo -n '\t"' >> $@;\
		echo -n "$$line" | sed -E 's-([^/]*/)*((.)*)$$-\2-g' | sed 's-\.md--g' >> $@;\
		echo -n "\": $$n,\n"  >> $@ ;\
	done < order
	@echo "}" >> $@

#test:
#	pandoc $(shell cat order | grep -E "./lectures/.*.md|./docs/.*md") -o test.html 


###
# Source / Project
###


# List of projects (that is, of folders) in PROJECT_DIR
PROJECTS_LIST := $(shell find $(PROJECT_DIR) -maxdepth 1 -mindepth 1 -type d)
# We construct the list of projects (as zip files) to construct based on it:
PROJECTS_TARGETS := $(addprefix $(BUILD_DIR), $(addsuffix .zip, $(PROJECTS_LIST)))

# Rule to copy one individual project as a zip file:
$(BUILD_DIR)code/projects%.zip: code/projects%.zip
	mkdir -p $(dir $@) 
	rsync -av $(subst $(BUILD_DIR),,$@) $@

# Rule to create one individual project and zip it:
# The code below is taken from and documented at 
# https://github.com/csci-1301/C-Sharp-project-maker
code/projects%.zip: code/projects/%/*/Program.cs | code/projects/%/*/*.cs
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
	

	
	
# Phony rule to display variables
.PHONY: test
	$(info $$var is [${TARGET_WOFF_FONT_FILES}])


all: $(TARGET_MD_FILES) $(TARGET_WOFF_FONT_FILES) $(PROJECTS_TARGETS)

.PHONY: clean
clean:
	@echo "cleaning build artifacts..."
	@rm -rf $(BUILD_DIR)

#deploy:
#	git checkout quartz-migration
#	npx quartz build --serve --concurrency 8	
