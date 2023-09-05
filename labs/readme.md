---
title: List of Labs
---

<!--
This directory contains all lab exercises. At build time these labs are compiled into instructions in various document formats with an optional, accompanying source code solution.
-->

# Suggested Order

|  Week | Lab Topic      | 
|  ---  | ---------------|
|  1    | [Introduction](https://csci-1301.github.io/labs/Introduction/)  | 
|  2    | [Hello World](https://csci-1301.github.io/labs/HelloWorld/), [First Program](https://csci-1301.github.io/labs/FirstProgram/)  | 
|  3    | [Variables](https://csci-1301.github.io/labs/Variables/), [Casting](https://csci-1301.github.io/labs/Casting/)  | 
|  4    | [User Input](https://csci-1301.github.io/labs/UserInput/), [Introduction to Classes](https://csci-1301.github.io/labs/Rectangle/)  | 
|  5    | [Class Diagram](https://csci-1301.github.io/labs/ClassDiagram/), [Constructor and ToString](https://csci-1301.github.io/labs/ConstructorToString/) |  
|  6    | [Precise Rectangle](https://csci-1301.github.io/labs/PreciseRectangle/)  | 
|  7    | [Booleans](https://csci-1301.github.io/labs/Booleans/), [If](https://csci-1301.github.io/labs/If/), [If and Switch](https://csci-1301.github.io/labs/IfAndSwitch/)  |  
|  8    | [Increment Decrement](https://csci-1301.github.io/labs/If/), [While](https://csci-1301.github.io/labs/While/) | 10/05: Quiz #3 |
|  9    | [Validating Input](https://csci-1301.github.io/labs/ValidatingInput/)  | 
|  10   | [Do While](https://csci-1301.github.io/labs/DoWhile/)   | 
|  11   | [Overflow and Underflow](https://csci-1301.github.io/labs/OverflowAndUnderflow/)  | 
|  12   | [Char and Int Conversion](https://csci-1301.github.io/labs/Char/)    | 
|  13   | [First Arrays Manipulations](https://csci-1301.github.io/labs/ArrayBasics/), [For Loops](https://csci-1301.github.io/labs/For/)  | 
|  14   | [Using static keyword](https://csci-1301.github.io/labs/Static/)  | 
|  15   | [Chemical Elements](https://csci-1301.github.io/labs/ChemicalElements/), [GradeCalculator](https://csci-1301.github.io/labs/GradeCalculator/), [Random](https://csci-1301.github.io/labs/Random/)

# Prerequisites and related lectures

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
| [ValidatingInput](/labs/ValidatingInput) | [While](/labs/While) | [Loops](/lectures/110_while_loops_and_vocabulary) | using TryParse and validating user input<br/>- `while` loop and `TryParse`<br/>- `if`, `switch`<br/>- `ToUpper()`, `ToLower()`<br/>- `char` type<br/>- `Console.ReadKey()`: assumed unknown, introduced in the lab |
| [For](/labs/For) | [ValidatingInput](/labs/ValidatingInput) | [For Loops](/lectures/150_for_loops) | while loops ⬄ for loops; using for loops (incl. validation); for with continue, break |
| [ArrayBasics](/labs/ArrayBasics) | [Variables](/labs/Variables) | [Arrays](/lectures/140_arrays) | - declaring and initializing arrays<br/>- get and set array values<br/>- array `Length` property<br/>- (optional) loop over an array  |
| [Foreach](/labs/Foreach) | [ArrayBasics](/labs/ArrayBasics) | [Foreach](/lectures/160_foreach) | Using foreach loop |
| [GradeCalculator](/labs/GradeCalculator) | - | - | Looping and collecting data from user.
| [ArrayOperations](/labs/ArrayOperations) | [ArrayBasics](/labs/ArrayBasics), [For](/labs/For) | [Arrays](/lectures/140_arrays) | Displaying, counting, and finding values; nested loops and arrays |
| [AdvancedArrays](/labs/AdvancedArrays) | [ArrayBasics](/labs/ArrayBasics), [Static](/labs/Static), [Foreach](/labs/Foreach) | [Arrays](/lectures/140_arrays) | (long!) Implementing array methods to find first/last index, min/max, etc. |
| [Char](/labs/Char) | [Variables](/labs/Variables), [If](/labs/If) | ? | char ⬄ int; comparing characters, string comparison |
| [Random](/labs/Random) | [ArrayBasics](/labs/ArrayBasics), [While](/labs/While) | [Random](/lectures/180_random) | Working with Random class |

# Alphabetically

<!-- the remainder of this document will be generated dynamically. Do not edit below this line! -->

| Lab title | Instructions | Program |
| :-- | --- | --- |
