# Lecture Notes

This directory contains all lecture notes. CSCI 1301 Book is automatically generated from the contents of this directory.

## How to create new lectures

When creating a new lecture, let's call it `lecture xyz`:

1. Create a directory called `NNN_lecture_xyz` 

    - follow the existing convention for numbering and letter case
    - the numbers tell pandoc how to order book content. Use leading zero and increments of 10. Choose a number number based on where in the book the new lecture should appear.

2. under that directory, create new file `readme.md`. Write lecture notes in this file using markdown.

Following these steps will automatically include the new lecture in the book. 

Do not include meta section in individual lecture notes because they will be concatenated. The book [meta data file is here](/templates/book_meta.md).

Next create an entry for the new lecture in the table below. Label all prerequisites and related labs.

## Prerequisites and related labs
    
<!-- Add descriptions of all lectures here, we might want to put this in a standalone markdown file then it can be included in other documents? -->

| Lecture title | Prerequisites | Related Labs |  Description |
| :--- | :--- | :--- | :--- |
| [General Concepts](/lectures/010_general_concepts) | None | [`HelloWorld`](/labs/HelloWorld) | Basic concepts about computers and programming |
| [First Program](/lectures/020_first_program) | None | [`HelloWorld`](/labs/HelloWorld) | Explains the components of a simple "Hello World" program |