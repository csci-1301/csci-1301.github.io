# Labs

This directory contains all lab exercises. 

## How to create new labs

1. Choose a short and unique name that describes the lab
2. Create a directory matching that name (use PascalCase since this is C#)
3. Under the lab directory create:

    1. `readme.md` (case sensitive) - write lab instructions in this file. You should include meta fields, at minimum a title
    2. (optional) if you want to include starter code with the lab,
        - create a subdirectory called `src`
        - create a subdirectory with the name of the solution you would like to use,
        - create a subdirectory with the name of the project you would like to use,
        - create a file called `Program.cs` in `src/<solution>/<project>/Program.cs`
    Write your code in this file, add a class file if you want in the same folder, but only include program files (not solution or project): they will be created automatically using the project and solution's name you specified, and hosted in the lab's folder as `solution.zip`.

If you follow these instructions the lab will be automatically built into a distributable format when you commit changes. It works as follows:

1. readme will be converted to index (html, pdf, odt)
2. contents of `src` will be converted to a standalone C# solution as a zip file. This solution will have the same name as the folder in the lab directory which is why directory names should use PascalCase.
<!-- 3. all matching the described format will be included in `labs.zip` which you can find on the website or under releases -->

## Prerequisites and related lectures

<!-- Add a short description of what each lab contains. Also list prerequisites and reference to related lecture notes. -->

| Lab title | Prerequisites | Related Lectures |  Description |
| :--- | :--- | :--- | :--- |
| [Introduction](/labs/Introduction) | None | [General concepts](/lectures/010_general_concepts) | Overview of course resources, install IDE |
| [HelloWorld](/labs/HelloWorld) | [Introduction](/labs/Introduction) | [First Program](/lectures/020_first_program) | Compile and run hello world program |
| [FirstProgram](/labs/FirstProgram) | [Introduction](/labs/Introduction) | [First Program](/lectures/020_first_program) | Editing and creating a new programs and using Write and WriteLine |
| [Variables](/labs/Variables) | TODO | [DataTypes and Variables](/lectures/030_datatypes_and_variables) | Declaring variables and using arithmetic operators |
| [Casting](/labs/Casting) | TODO | TODO | Implicit and explicit type conversion |
| [UserInput](/labs/UserInput) | TODO | TODO | Reading input from user |