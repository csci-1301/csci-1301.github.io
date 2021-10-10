# Labs

This directory contains all lab exercises. At build time these labs are compiled into instructions in various document formats with an optional, accompanying source code solution.

## How to create new labs

1. Choose a short and unique name that describes the lab then create a directory matching that name
    - follow the existing convention for naming
    - do not number labs or make assumptions about numbering because another instructor may not follow the exact same lab order

2. Under the lab directory create:

    1. `readme.md` (case sensitive)
        - write lab instructions in this file. You should include meta data, at minimum a title
        - make the lab standalone to support alternative ordering (avoid assumptions about what was done "last time")
        - do not make assumptions about student using specific OS, include instructions for all supported options (Windows, MacOS, Linux)
        - do not make assumptions about student using Visual Studio, refer to IDE instead

    2. (optional) if you want to include starter code with the lab,
        - create a subdirectory called `src`
        - create a subdirectory with the name of the solution you would like to use,
        - create a subdirectory with the name of the project you would like to use,
        - create a file called `Program.cs` in `src/<solution>/<project>/Program.cs`

        Write your code in this file, add a class file if you want in the same folder, but only include program files (not solution or project): they will be created automatically using the project and solution's name you specified, and hosted in the lab's folder as `solution.zip`.

        Note / known issue: when including multiple solutions, the basename should be different, for example: `SomeLab` and `Solution_SomeLab` (instead of `SomeLabSolution`); to ensure solutions are packaged separately from one another.

    3. Create an entry for the new lab in the table below. List all prerequisite labs and related lectures.

If you follow these instructions the lab will be automatically built into a distributable format when you commit changes. It works as follows:

1. `readme.md` will be converted to lab instructions file called `index` (html, pdf, odt)
2. contents of `src` will be converted to a standalone C# solution as a zip file.

Using this established build system generates labs that are cross-platform (Windows, MacOS, Linux) and work on different IDEs. Do not attempt to create labs locally as that approach does not have the same cross-platform guarantee.

## Prerequisites and related lectures

<!-- Add a short description of what each lab contains. Also list prerequisite labs and add a link to related lecture notes. -->

| Lab title | Prerequisites | Related Lectures |  Description / Topics / Required skills |
| :--- | :--- | :--- | :--- |
| [Introduction](/labs/Introduction) | None | [General concepts](/lectures/010_general_concepts) | Overview of course resources, complete survey, install IDE
| [HelloWorld](/labs/HelloWorld) | [Introduction](/labs/Introduction) | [First Program](/lectures/020_first_program) | - compilation, execution<br/>- basic C# syntax<br/>- `Write`, `WriteLine` |
| [FirstProgram](/labs/FirstProgram) | [Introduction](/labs/Introduction) | [First Program](/lectures/020_first_program) | - `Write`, `WriteLine`<br/>- escape sequences |
| [Variables](/labs/Variables) | [FirstProgram](/labs/FirstProgram) | [DataTypes and Variables](/lectures/030_datatypes_and_variables) | - datatypes (`string`,`int`,`float`,`double`,`decimal`)<br/>- string interpolation</br>- variable declaration, assignment<br/>- operators: `+ - * / %`<br/>- compound assignment: `+= -= *= /= %=`<br/>- "read-only" example with explicit cast |
| [Casting](/labs/Casting) | [Variables](/labs/Variables) | [Operators](/lectures/040_operators) | - operators: `+ - * / %`<br/>- string interpolation<br/>- implicit and explicit cast |
| [UserInput](/labs/UserInput) | [Variables](/labs/Variables) | [Reading and Displaying](/lectures/050_reading_and_displaying) | Reading input from user<br/>- `Parse` method<br/>- `ReadLine()` |
| [Rectangle](/labs/Rectangle) | [Variables](/labs/Variables)  | [Introduction to Objects](/lectures/060_object_oriented_intro) | Implementing a class with attributes and methods<br/>- getters, setters<br/>- implementing other methods |
| [PreciseRectangle](/labs/PreciseRectangle) | [Rectangle](/labs/Rectangle) | [Introduction to Objects](/lectures/060_object_oriented_intro) | Extending a class, writing a class from scratch<br/>- attributes, methods<br/>- constants |
| [ClassDiagram](/labs/ClassDiagram) | [Rectangle](/labs/Rectangle)  |[Introduction to Objects](/lectures/060_object_oriented_intro) | Practice reading and creating a UML class diagrams |
| [ConstructorToString](/labs/ConstructorToString) | [PreciseRectangle](/labs/PreciseRectangle) | [Advanced Objects](/lectures/070_object_oriented_contd) | Writing a class with custom constructors and `ToString()` |
| [Static](/labs/Static) | [Rectangle](/labs/Rectangle) | [Static](/lectures/170_static_elements) | static classes, static class members |
| [ChemicalElements](/labs/ChemicalElements) | [Rectangle](/labs/Rectangle) | [Static](/lectures/170_static_elements) | static methods and method calls in non-static class |
| [Booleans](/labs/Booleans) | [FirstProgram](/labs/FirstProgram) | [Decisions and Decision Structures](/lectures/080_decisions_booleans_and_comparisons) | Evaluating Boolean expressions<br/>- truth tables<br/>- operators: `==`,`!=`,`<`,`>`,`<=`,`>=`,`&&`,`\|\|`,`!` <br/>- evaluation of expressions<br/>- precedence |
| [If](/labs/If) | [Booleans](/labs/Booleans) | [if, if-else and Nested if Statements](/lectures/090_if) | Reading and writing if statements <br/>- `if`, `if-else`, `if-else-if`<br/>- using `%` operator to determine parity |
| [IfAndSwitch](/labs/IfAndSwitch) | [If](/labs/If) | [Switch Statements](/lectures/100_switch) | Using switch, choosing between if and switch<br/>- `switch` syntax<br/>- convert: `if` ⬄ `switch`<br/>- ternary conditional operator (optional) |
| [IncrementDecrement](/labs/IncrementDecrement) | [If](/labs/If) | [Loops](/lectures/110_while_loops_and_vocabulary) | - operators: `++`, `--`<br/>- simple `while` loop |
| [While](/labs/While) | [IncrementDecrement](/labs/IncrementDecrement) | [Loops](/lectures/110_while_loops_and_vocabulary) | - operators: `++`, `--`<br/>- Boolean expressions<br/>- string interpolation<br/>- implementing `while` loops<br/>- infinite loops<br>- user I/O, `Parse` |
| [DoWhile](/labs/DoWhile) | [While](/labs/While) | [Loops](/lectures/110_while_loops_and_vocabulary) | - `do while` loops<br/>- `while` loops<br/>- `TryParse`, user I/O |
| [ValidatingInput](/labs/ValidatingInput) | [While](/labs/While) | [Loops](/lectures/110_while_loops_and_vocabulary) | using TryParse and validating user input<br/>- `TryParse`<br/>- `if`, `switch`<br/>- `Console.ReadKey()`<br/>- `ToUpper()`, `ToLower()`<br/>- `char` type |
| [For](/labs/For) | [ValidatingInput](/labs/ValidatingInput) | [For Loops](/lectures/150_for_loops) | while loops ⬄ for loops; using for loops (incl. validation); for with continue, break |
| [ArrayBasics](/labs/ArrayBasics) | [Variables](/labs/Variables) | [Arrays](/lectures/140_arrays) | Declaring and initializing arrays, get and set array values |
| [Foreach](/labs/Foreach) | [ArrayBasics](/labs/ArrayBasics) | [Foreach](/lectures/160_foreach) | Using foreach loop |
| [ArrayOperations](/labs/ArrayOperations) | [ArrayBasics](/labs/ArrayBasics), [For](/labs/For) | [Arrays](/lectures/140_arrays) | Displaying, counting, and finding values; nested loops and arrays |
| [AdvancedArrays](/labs/AdvancedArrays) | [ArrayBasics](/labs/ArrayBasics), [Static](/labs/Static), [Foreach](/labs/Foreach) | [Arrays](/lectures/140_arrays) | (long!) Implementing array methods to find first/last index, min/max, etc. |
| [Char](/labs/Char) | [Variables](/labs/Variables), [If](/labs/If) | ? | char ⬄ int; comparing characters, string comparison |
| [Random](/labs/Random) | [ArrayBasics](/labs/ArrayBasics), [While](/labs/While) | [Random](/lectures/180_random) | Working with Random class |
