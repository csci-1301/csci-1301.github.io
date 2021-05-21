    # C# Fundamentals

## Introduction to the C# Language

- C# is a managed language (as introduced in previous lecture)
    - Write in a high-level language, compile to intermediate language, run intermediate language in interpreter
    - Intermediate language is called CIL (Common Intermediate Language)
    - Interpreter is called .NET Runtime
    - Standard library is called .NET Framework, comes with the compiler and runtime
- It is widespread and popular
    - [7th most used language on StackOverflow]((https://insights.stackoverflow.com/survey/2017#technology-programming-languages>)), 5th-most if you discount JavaScript and HTML (which are used for websites, not programs)
    - .NET is the 2nd most used library/framework

## The Object-Oriented Paradigm

- C# is called an "object-oriented" language
    - Programming languages have different *paradigms*: philosophies for organizing code, expressing ideas
    - Object-oriented is one such paradigm, C# uses it
    - Meaning of object-oriented: Program mostly consists of *objects*, which are reusable modules of code
    - Each object contains some data (*attributes*) and some functions related to that data (*methods*)
- Object-oriented terms
    - **Class**: A blueprint or template for an object. Code that defines what kind of data the object will contain and what operations (functions) you will be able to do with that data
    - **Object**: A single instance of a class, containing running code with specific values for the data. Each object is a separate "copy" based on the template given by the class.
    - **Method**: A function that modifies an object. This is code that is defined (written) in the class, but when it runs, it only runs on/for a specific object and modifies that object.
    - **Attribute**: A piece of data stored in an object
- Example objects:
    - "Car" object, represents a car
        - Attributes: Color, wheel size, engine status (on/off/idle), gear position
        - Methods: Press gas or brake pedal, turn key on/off, shift transmission
    - "Audio" object, represents a song being played in a music player
        - Attributes: Sound wave data, current playback position, target speaker device
        - Methods: Play, pause, stop, fast-forward, rewind
    
# First Program

Here's a simple "hello world" program in the C# language:


#### Hello World

<!-- TODO: title this code block -->

```
!include code/hello_world.cs
```

Features of this program:

- A multi-line comment: everything between the `/*` and `/*` is considered a *comment*, i.e. text for humans to read. It will be ignored by the C# compiler and has no effect on the program.
- A `using` statement: This imports code definitions from the System *namespace*, which is part of the .NET Framework (the standard library).
    - In C#, code is organized into **namespaces**, which group related classes together
    - If you want to use code from a different namespace, you need a `using` statement to "import" that namespace
    - All the standard library code is in different namespaces from the code you will be writing, so you'll need `using` statements to access it
- A class declaration
    - Syntax: `class [name of class]`, then `{` to begin the body of the class, then `}` to end the body of the class
    - All code between opening `{` and closing `}` is part of the class named by the `class [name]` statement
- A method declaration
    - The name of the method is `Main`, and is followed by empty parentheses (we'll get to those later, but they're required)
    - Just like with the class declaration, after the name, `{` begins the body of the method, `}` ends it
- A statement inside the body of the method
    - This is the part of the program that actually "does something": It prints a line of text to the console
    - A statement *must* end in a semicolon (the class header and method header aren't statements)
    - This statement contains a class name (`Console`), followed by a method name (`WriteLine`). It calls the `WriteLine` method in the `Console` class.
    - The **argument** to the `WriteLine` method is the text "Hello, world!", which is in parentheses after the name of the method. This is the text that gets printed in the console: The `WriteLine` method (which is in the standard library) takes an argument and prints it to the console.
    - Note that the argument to `WriteLine` is inside double-quotes. This means it is a **string**, i.e. textual data, not a piece of C# code. The quotes are required in order to distinguish between text and code.
- An in-line comment: All the text from the `//` to the end of the line is considered a comment, and is ignored by the C# compiler.

## Rules of C# Syntax

- Each statement must end in a semicolon (`;`),
    - Class and method declarations are not statements
    - A method *contains* some statements, but it is not a statement
- All words are case-sensitive
    - A class named `Program` is not the same as one named `program`
    - A method named `writeline` is not the same as one named `WriteLine`
- Braces and parentheses must always be matched
    - Once you start a class or method definition with `{`, you must end it with `}`
- Whitespace -- spaces, tabs, and newlines -- has almost no meaning
    - There must be at least 1 space between words
    - Spaces are counted exactly if they are inside string data, e.g. `"Hello      world!"`
    - Otherwise, entire program could be written on one line; it would have the same meaning
    - Spaces and new lines are just to help humans read the code
- All C# applications must have a `Main` method
    - Name must match exactly, otherwise .NET runtime will get confused
    - This is the first code to run when the application starts -- any other code (in methods) will only run when its method is called

## Conventions of C# Programs

- Conventions: Not enforced by the compiler/language, but expected by humans
    - Program will still work if you break them, but other programmers will be confused
- Indentation
    - After a class or method declaration (header), put the opening `{` on a new line underneath it
    - Then indent the next line by 4 spaces, and all other lines "inside" the class or method body
    - De-indent by 4 spaces at end of method body, so ending `}` aligns vertically with opening `{`
    - Method definition inside class definition: Indent body of method by another 4 spaces
    - In general, any code between `{` and `}` should be indented by 4 spaces relative to the `{` and `}`
- Code files
    - C# code is stored in files that end with the extension ".cs"
    - Each ".cs" file contains exactly one class
    - The name of the file is the same as the name of the class (Program.cs contains `class Program`)

## Reserved Words and Identifiers

- Reserved words: Keywords in the C# language
    - Note they have a distinct color in the code sample and in Visual Studio
    - Built-in commands/features of the language
    - Can only be used for one specific purpose; meaning cannot be changed
    - Examples:
        - `using`
        - `class`
        - `public`
        - `private`
        - `namespace`
        - `this`
        - `if`
        - `else`
        - `for`
        - `while`
        - `do`
        - `return`
- Identifiers: Human-chosen names
    - Names for classes (`Rectangle`, `ClassRoom`, etc.), variables (`age`, `name`, etc.), methods (`ComputeArea`, `GetLength`, etc), namespaces, etc.
    - Some have already been chosen for the standard library (e.g. `Console`, `WriteLine`), but they are still identifiers, not keywords
    - Rules for identifiers:
        - Must not be a reserved word
        - Must contain only letters (`a` → `Z`), numbers (`0` → `9`), and underscore (`_`)-- no spaces
        - Must not begin with a number
        - Are case sensitive
    - Conventions for identifiers
        - Should be descriptive, e.g. "`AudioFile`" or "`userInput`" not "`a`" or "`x`"
        - Should be easy for humans to read and type
        - If name is multiple words, use [CamelCase](https://en.wikipedia.org/wiki/Camel_case) (or its variation [Pascal case](https://www.c-sharpcorner.com/UploadFile/8a67c0/C-Sharp-coding-standards-and-naming-conventions/)) to distinguish words
        - Class and method names should start with capitals, e.g. "`class AudioFile`"
        - Variable names should start with lowercase letters, then capitalize subsequent words, e.g. "`myFavoriteNumber`"

 
