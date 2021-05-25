# Writing A Class

## Introduction


Let us introduce a couple of key notions for object-oriented programming languages:

- We will be using _classes_ and _objects_: A class is the specification (you can think of a cookie cutter, a blueprint, a model), and an object is the "actual thing" (the actual cookie my kid ate, my house, your car, …).
- To create an object from a class will need to *instantiate* it.
- An object will *be* and *do*, that is, have *data* and *operations*. The class has *attributes* and *methods* (or procedures). When we instantiate, the object has *instance variables*.
- An object hides its structure: to have access to the value of the instance variables, you have to use properties (methods to access those attributes). Classes *encapsulate* the attributes and methods of the object and hides them (and the implementation details) from the other objects.
- Inheritance: a class can inherit from another class, i.e., extend it with new attributes or methods. A class can be extended in different ways, and those extensions can also be extended!

## Code Sample

```{.cs}
class Rectangle
{

/*
   A rectangle
    - has a length, a width, (attributes)
    - can be given a length, a width, can return its length, its width, and its area (methods).
    */

// Let us start with the attributes.

    private int length;
    private int width;
    
    // The key words "public" and "private" are "access modifiers".

// Now, for the methods.
// Every method will be of the form:
// public <return type> <Name>(<type of parameter> <name of parameter>){ <collection of statements>}

    public void SetLength(int lengthParameter)
    // Parameters are "local variables".
    {
        length = lengthParameter;
    }

    // This method will simply "take" the argument given, and store it as the length of the object.
    // Of course, a method could perform more advanced operations, like test the value, change it, compare it against other values, etc.

    public int GetLength()
    {
        return length;
    }

   public void Setwidth(int widthParameter)
    {
        width = widthParameter;
    }
    public int GetWidth()
    {
        return width;
    }

    public int ComputeArea()
    {
        return length * width;

    }
}
```

We will use this class in a separate file which contains a `Main` method that will create a rectangle object and manipulate it.

```{.cs}
using System;

    class Program
    {
        static void Main(string[] args)
        {

        Rectangle myRectangle = new Rectangle(); // Instantiation
        myRectangle.SetLength(12); // Calling the classes' object.methodname(argument)
        myRectangle.Setwidth(3);

        Console.WriteLine($"You program's length is {myRectangle.GetLength()}" +
            $", its width is {myRectangle.GetWidth()}" + 
            $", so its area is {myRectangle.ComputeArea()}.");
        }
    }
```


Sometimes, "Parameters" are called "formal parameters" and "arguments" are called "actual parameters".
Stated differently, a method *has parameters* and *takes arguments*.


### Key Notions


- A class has _members_ (<https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/members>) that can be "data members" (attributes) and "function members" (methods).
- A method can be an "accessor" (if it allows to access the value of an attribute) that either sets ("setters") or retrieves ("getter") the value of an attribute. Other kinds of methods, like constructors, will be studied later on.

Some of the new keywords we are using are:

- `public` and `private`, which are access modifiers (everything is private by default).
- `return`, which gives what needs to be returned, according to the return type of the method.
- `new`, which instantiates a class.

# Unified Modeling Language

UML is a _specification language_ with multiple benefits:

- It is cross-language (you can use it to describe a class written in C#, Java, Python, …),
- It represents only the "surface", and the implementations details are left to programmers,
- It is a language to interact with non-programmer, or with programmers that simply want to use the class without knowing all of its details.

A class is represented as follows:

| **ClassName**
| :--: |
| - attribute: `int`|
| + SetAttribute(attributeParameter: `int`): `void` |
| + GetAttribute(): `int` |


Note that `void` is optional.
For our Rectangle class, this gives:

| **Rectangle** |
| :---: |
| - width: `int` |
| - length: `int` |
| + SetLength(lengthParameter : `int`): `void` |
| + GetLength(): `int` |
| + Setwidth(widthParameter: `int`): `void` |
| + GetWidth(): `int` |
| + ComputeArea(): `int` |
