---
title: User Guide
---

This guide explains how this repository is organized and how to maintain this resource.

## Resources Organization 

This repository is organized as follows

| path | description |
--- | ---
| `.github` | Templating files used by github |
| `code` | code examples |
| `docs` | additional helpful documents |
| `img` | all images |
| `labs` | lab exercises |
| `lectures` | lecture notes |
| `problems` | practice problems |
| `templates` | templates and meta data files used for building this resource |

Additional configuration files are at the root of this repository.

### Locating course resources

<!-- Where to find the code for the lecture notes / labs / etc. -->

The latest compiled version of all course resources is available on the [accompanying website](https://csci-1301.github.io/). This website includes the course textbook in
all supported formats, links to labs, and all other available student resources.

<!-- still working on this -- website will include all that stuff -->

Earlier versions of course material can be found under [releases](https://github.com/csci-1301/csci-1301.github.io/releases).

<!-- add details about mirror websites, achives, galileo, etc. -->

## Editing Resources

### Creating new lectures

When creating a new lecture, let's call it `lecture xyz`:

1. first create a directory called `lecture_xyz` under `lectures` directory

    Following the existing pattern for naming convention which is lowercase and
    separation by underscores.

2. under that directory, create an `readme.md` (lowercase)

    Here we use filename readme as it works nicely with Github. The build system will look for files matching this pattern. Pandoc appears to use a case-insensitive match pattern, at least currently, but to be safe use lowercase convention when naming this file to [match the expected pattern](https://github.com/csci-1301/csci-1301.github.io/blob/d0cca5dfab111ed9148256992b63fbed9c05b880/Makefile#L14).

Following these steps will automatically include the new lecture in the book. 

Do not include meta section in individual lecture files because these lectures will be concatenated by pandoc into single larger document. Any meta data in individual files would appear somewhere in the middle of the larger document, and as such will not be treated as front matter.

### Creating new labs

- [ ] TODO

## Content Labelling

Course resources are labelled with emoji shortcodes or text labels.

Each resource should, at minimum, list its prerequisites and security-related label.

### Labelling with shortcodes

Use of emoji shortcodes to label course resources

| Description | Shortcode | Icon |
--- | --- | ---
| Security related aspects will be labelled as "security" | `:lock:` | :lock: |
| Optional parts will be labelled as "optional" | `:question:` | ❓ |
| Examples of common pitfalls | `:warning:` | ⚠️ |

### Labelling using text labels

1. Each resource will be labelled with prerequisites. 

    This is a list of 0 or more values. For 0 we write `None`. These requirements are expressed in the associated index of lectures/labs/problems, ([see example here](https://github.com/csci-1301/csci-1301.github.io/tree/main/lectures)).

2. Lecture notes and slides will be labelled by related labs, and vice versa

    These requirements are expressed in the associated index of lectures and labs, ([see example here](https://github.com/csci-1301/csci-1301.github.io/tree/main/lectures)).


## Styling and Templating

Templating files are under `templates` directory.

<!-- add more details... -->

## Repository Maintenance

This repository uses following tools and technologies

- git - version control
- Github - to make source code available on the web
- markdown, LaTeX - for writing the resources
- pandoc - for converting documents to various formats
- make, bash - to specify how to build this resource
- travis-ci - to automatically build the resource
- github pages - to serve the accompanying website
- additional packages for specific tasks: texlive, Pygments, pandoc filters, etc.

### Building the resource locally

It is generally not necessary to build this resource locally unless you want to see
what it will look like in advance or when making changes to the build system.

**Install required dependencies**

- [ ] what needs to be installed

**Running the build**

From the repository root run:

```
make all
```
