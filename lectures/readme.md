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

| Lecture title | Prerequisites | Related Labs | Description |
| :----------   | :----------   | :----------  | :---------- |
| [General Concepts](/lectures/010_general_concepts) | None | [Introduction](/labs/Introduction) | Basic concepts about computers and programming |
| [First Program](/lectures/020_first_program) | None | [HelloWorld](/labs/HelloWorld), [FirstProgram](/labs/FirstProgram) | Explains the components of a simple "Hello World" program |
| [Datatypes and Variables](/lectures/030_datatypes_and_variables) | [First Program](/lectures/020_first_program) | [Variables](/labs/Variables) | Variable declaration and initialization and overview of data types |
| [Operators](/lectures/040_operators) |  [Datatypes](/lectures/030_datatypes_and_variables), [First Program](/lectures/020_first_program) | [Variables](/labs/Variables), [Casting](/labs/Casting) | Operators, conversions, and precedence |
| [User Input and Output](/lectures/050_reading_and_displaying) | [Datatypes](/lectures/030_datatypes_and_variables), [First Program](/lectures/020_first_program) | [Personalized Welcome Message](/labs/UserInput),  | ReadLine, parsing, and ToString |
| [Introduction to Objects](/lectures/060_object_oriented_intro) | [Datatypes](/lectures/030_datatypes_and_variables), [Operators](/lectures/040_operators) | [Rectangle](/labs/Rectangle), [PreciseRectangle](labs/PreciseRectangle) | The Rectangle class, introduction to UML, methods and return types, variable scope, constants, and an explanation/demonstration of reference types |
| [More Object Concepts](/lectures/070_object_oriented_contd) | [Introduction to Objects](/lectures/060_object_oriented_intro) | [PreciseRectangle](/labs/PreciseRectangle) | The ClassRoom class, writing constructors, writing ToString methods, method overloading, and properties |
| [Decisions and Decision Structures](/lectures/080_decisions_booleans_and_comparisons) | [User Input and Output](/lectures/050_reading_and_displaying) | [Booleans](/labs/Booleans) | Boolean expressions and related operators |
| [if, if-else and Nested if Statements](/lectures/090_if) | [Decisions and Decision Structures](/lectures/080_decisions_booleans_and_comparisons) | [If](/labs/If) | Reading and writing if statements |
| [Switch Statements](/lectures/100_switch) | [if, if-else and Nested if Statements](/lectures/090_if) | [IfAndSwitch](/labs/IfAndSwitch) | Switch statement and the conditional operator |
| [Loops](/lectures/110_while_loops_and_vocabulary) | [if, if-else and Nested if Statements](/lectures/090_if) | [ValidatingInput](/labs/ValidatingInput) | while and do while loops; TryParse |
| [Combining Methods and Decision Structures](/lectures/130_combining_decision_and_classes) | [Introduction to Objects](/lectures/060_object_oriented_intro), [Switch Statements](/lectures/100_switch) | [ValidatingInput](/labs/ValidatingInput) | The "LoanCalculator" ... |
| [Arrays](/lectures/140_arrays) | | [ArrayBasics](/labs/ArrayBasics) | Arrays |
 