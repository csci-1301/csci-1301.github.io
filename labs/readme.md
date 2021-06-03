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

    3. Create an entry for the new lab in the table below. List all prerequisite labs and related lectures.

If you follow these instructions the lab will be automatically built into a distributable format when you commit changes. It works as follows:

1. `readme.md` will be converted to lab instructions file called `index` (html, pdf, odt)
2. contents of `src` will be converted to a standalone C# solution as a zip file. 

Using this established build system generates labs that are cross-platform (Windows, MacOS, Linux) and work on different IDEs. Do not attempt to create labs locally as that approach does not have the same cross-platform guarantee.

## Prerequisites and related lectures

<!-- Add a short description of what each lab contains. Also list prerequisite labs and add a link to related lecture notes. -->

| Lab title | Prerequisites | Related Lectures |  Description |
| :--- | :--- | :--- | :--- |
| [Introduction](/labs/Introduction) | None | [General concepts](/lectures/010_general_concepts) | Overview of course resources, complete survey and install IDE |
| [HelloWorld](/labs/HelloWorld) | [Introduction](/labs/Introduction) | [First Program](/lectures/020_first_program) | Compile and run hello world program |
| [FirstProgram](/labs/FirstProgram) | [Introduction](/labs/Introduction) | [First Program](/lectures/020_first_program) | Creating a new program, using Write and WriteLine and escape sequences |
| [Variables](/labs/Variables) | [FirstProgram](/labs/FirstProgram) | [DataTypes and Variables](/lectures/030_datatypes_and_variables) | Declaring and displaying variables and using arithmetic operators |
| [Casting](/labs/Casting) | [Variables](/labs/Variables) | [Operators](/lectures/040_operators) | Implicit and explicit type conversion, using cast operator |
| [UserInput](/labs/UserInput) | [Variables](/labs/Variables) | [Reading and Displaying](/lectures/050_reading_and_displaying) | Reading input from user |
| [Rectangle](/labs/Rectangle) | [Introduction](/labs/Introduction) | [Introduction to Objects](/lectures/060_object_oriented_intro) | Implementing a class with attributes and methods |
| [PreciseRectangle](/labs/PreciseRectangle) | [Rectangle](/labs/Rectangle) | [Introduction to Objects](/lectures/060_object_oriented_intro) | |
