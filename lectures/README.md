# Lecture Notes

This directory contains all lecture notes. CSCI 1301 Book is automatically generated from the contents of this directory.

### Instructions for creating new lectures

When creating a new lecture, let's call it `lecture xyz`:

1. Create a directory called `NNN_lecture_xyz` 

    - follow the existing convention for numbering and case
    - the numbers tell pandoc how to order book content. Use leading zero and increments of 10. Choose a number number based on where in the book the new lecture should appear.

2. under that directory, create new file `readme.md`. Write lecture notes in this file using markdown.

Following these steps will automatically include the new lecture in the book. 

Do not include meta section in individual sections because they will be concatenated. The book [meta data file is here](/templates/meta.md).

## Prerequisites and related labs
    
<!-- Add descriptions of all lectures here -->

| Lecture title | Prerequisites | Related Labs |  Description |
| :--- | :--- | :--- | :--- |
| [General Concepts](/lectures/general_concepts) | None | [`hello_world`](/labs/hello_world) | Basic concepts about computers and programming |
| [Hello World](/lectures/hello_world) | None | [`hello_world`](/labs/hello_world) | Explains the components of a simple "Hello World" program |