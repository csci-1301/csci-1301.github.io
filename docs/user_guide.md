---
title: User Guide
---

This guide explains how this resource and its source code is organized, how it is built and how to maintain this resource.

# Resources Organization 

This repository is organized as follows

| path | description |
:--- | :---
| `.github` | github templates and workflow files |
| `code` | code examples |
| `docs` | additional helpful documents |
| `img` | all images |
| `labs` | lab exercises |
| `lectures` | lecture notes |
| `problems` | practice problems |
| `templates` | templates and meta data files used for building this resource |
| `index.md` | website index page |

Additional configuration files are at the root of the source code repository.

## Locating course resources

<!-- Where to find the code for the lecture notes / labs / etc. -->

Ways to obtaining the **latest version** of this resource:

1. visit the [accompanying website](https://csci-1301.github.io/) - this website includes the course textbook in all supported formats, links to labs, and all other available student resources
2. TODO: AU mirror website/box/instructor website
3. latest version is also available under [releases](https://github.com/csci-1301/csci-1301.github.io/releases) on Github

Ways to obtain **earlier** versions of this resource:

1. Earlier versions can be found under [releases](https://github.com/csci-1301/csci-1301.github.io/releases) on Github
2. Earlier versions will be archived on Galileo 

<!-- other places? -->
 

# Editing Resources

If you are new to this project and looking to contribute, first see [Contributing Guidelines](/contributing) to learn how to participate in the editing of this resources.

## Best practices for all forms of content

- **Structure for accesibility**
    - All content should be titled
        - TODO: explain how
    - All content should be [labelled](#content-labelling)
        - at minimum list prerequisites and security-related aspects
- **Images**
    - Images require a descriptive alt tag for accessibility
    - Store images in the repository in `img` directory because pandoc will look for images there 
    - When refering to images in markdown, use path from root even if the image may appear broken locally
- **Source code**
    - source code programs belong in `code` directory 
        - the code included in this directory should be a complete program
        - the program should compile and terminate
        - we can automatically check these code snippets for syntactical correctness if these expectations are followed
        - such program can be included in lecture notes of labs by using pandoc-include filter
    - source code that is faulty, partial or does not terminate can be included in markdown as an inline code block
    - only include code in text form such that it can be copy-pasted for reuse

## Creating new lectures

To create a new lecture `lecture xyz`:

1. Create a directory called `NNN_lecture_xyz` under `lectures` directory

    Following the existing pattern for naming convention which is lowercase and separation by underscores. The numbers `NNN` tell pandoc how to order book content. Use leading zero and increments of 10. Choose a number number based on where in the book the new lecture should appear.

2. under that directory, create a new file `readme.md` (lowercase). Write lecture notes in this file using markdown.

    We use filename readme because the build script looks for files matching this pattern. Pandoc appears to use a case-insensitive matching, at least currently, but to be safe use lowercase convention when naming this file to [match the expected file pattern](https://github.com/csci-1301/csci-1301.github.io/blob/d0cca5dfab111ed9148256992b63fbed9c05b880/Makefile#L14).

Following these steps will automatically include the new lecture in the book. 

Do not include meta section in individual lecture files because these lectures will be concatenated by pandoc into single larger document. Any meta data in individual files would appear somewhere in the middle of the larger document, and as such will not be treated as front matter.

## Creating new labs

- [ ] TODO

# Content Labelling

Course resources are labelled with emoji shortcodes or text labels.

Each resource should, at minimum, list its prerequisites and security-related content.

## Labelling with shortcodes

Use emoji shortcodes to label following course resources

| Description | Shortcode | Icon |
| :--- | --- | --- |
| Security related aspects will be labelled as "security" | `:lock:` | :lock: |
| Optional parts will be labelled as "optional" | `:question:` | ❓ |
| Examples of common pitfalls | `:warning:` | ⚠️ |

## Labelling using text labels

1. Each resource will be labelled with prerequisites. 

    This is a list of zero or more values. For zero prerequisites we write `None`. These requirements are expressed in the associated index of lectures/labs/problems ([example](https://github.com/csci-1301/csci-1301.github.io/tree/main/lectures)).

2. Lecture notes and slides will be labelled by related labs, and vice versa

    These requirements are expressed in the associated index of lectures and labs ([example](https://github.com/csci-1301/csci-1301.github.io/tree/main/lectures)).


# Styling and Templating

Templating files are under `templates` directory.

Templates directory specifies layout files and stylesheets used in the website. These layouts are applied by pandoc when resources are built. Website CSS styles can also be found in this directory.


# Repository Maintenance

This repository uses following tools and technologies:

- git - version control
- Github - to make source code available on the web
- markdown, LaTeX - for writing the resources
- pandoc - for converting documents to various output formats
- make, bash - for specifying how to build this resource
- github actions - to automatically build the resource
- github pages - to serve the accompanying website
- additional packages for specific tasks: texlive, Pygments, pandoc filters, etc.

## How build outputs are generated

The resource material is organized into specific directories (cf. [resource organization](#resources-organization)).
These resources are then compiled into templated documents in various formats using [pandoc](https://pandoc.org/MANUAL.html). Different directories undergo different build steps as defined in the project [Makefile](https://github.com/csci-1301/csci-1301.github.io/blob/main/Makefile) and generate various outputs. For example, lecture notes are compiled into a textbook and labs are packaged into individual labs. The makefile explains the exact steps applied to each type of resource.

## Using Github actions with pandoc

This resource is built automatically every time changes are committed to the main branch of the repository. This is configured to run on [Github actions](https://github.com/features/actions). There are currently two configured [workflows](https://github.com/csci-1301/csci-1301.github.io/actions): one to build the resource and to deploy it, and a second one to check that any opened pull requests can be built successfully. 

The build configuration uses texlive (over texlive-full) to keep the dependency installation time low. Similarly, the
choice of Python packages is preferable for pandoc filters, because they are usually straightforward and fast to install. We want to avoid choosing packages that significantly increase build time.

Currently (May 2021) Github actions offers 2,000 free build minutes/month, which _should be_ sufficient for the needs of this project and hopefully remains free in perpetuity (if it does not there are other alternative services). Going with one specific CI service over another is simply a matter of preference. 

Following a successful build, the build script will automatically deploy the generated resources to an accompanying website hosted on [github pages](https://pages.github.com/). In the repository a special branch `gh-pages` represents the contents of the deployed website. It also allows maintainers to observe the generated build outputs. Generated build outputs can also be observed under [actions](https://github.com/csci-1301/csci-1301.github.io/actions).

## How to create releases

Currently a github action is setup to do the following: whenever a new commit is made to the main branch, the action
will build the resource and add the generated books as a pre-release under releases and tag them as "latest". If a subsequent commit occurs it will overwrite the previous latest files and become the new latest version. This cycle continues until maintainers are ready to make a versioned release (or "package").

Making a versioned release is done as follows:

1. Go to [repository releases](https://github.com/csci-1301/csci-1301.github.io/releases)
2. Choose latest, which contains the files of the latest build
3. Edit this release, giving it a semantic name and a version, such as `v1.0.0`. Name and version can be the same.
   (cf. [semantic versioning](https://semver.org/))
4. Enter release notes to explain what changed since last release
5. Uncheck `This is a pre-release`
6. Update release

Following these steps will generate a new, versioned release. The versioned releases will be manually uploaded to university mirror site, box, and archived.

## Building the resource locally

It is generally not necessary to build this resource locally unless the intent is to preview templating changes or to make changes to build scripts.
For the purposes of editing content, it is sufficient to make edits to markdown files and committing those changes. 

### Installing required dependencies

To find the current list of dependencies needed to build this resource, refer to the [build script install section](https://github.com/csci-1301/csci-1301.github.io/blob/main/.github/workflows/build.yaml) which lists all required packages need to build the resource. The exact installation steps vary depending on your local operating system.

In general the following dependencies are needed:

- pandoc
- LaTeX
- make
- python 3.+
- packages and filters: Pygments, pandoc-include

### Running the build

After installing all dependencies, from the repository root, run:

```bash
make all
```

To see a list of other alternative build options run

```
make
```
