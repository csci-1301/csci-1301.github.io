# A Class for ClassRoom

## UML - Specification

| **ClassRoom** |
| :--- |
| - name: `string` |
| - number: `int` |
| + SetName(nameParameter : `string`): `void` |
| + GetName(): `string` |
| + SetNumber(numberParameter: `int`): void |
| + GetNumber(): `int` |


## Implementation

~~~~~~~{.cs .numberLines}
using System;

class ClassRoom
{
    private string name;
    private int number;

    public void SetName(string nameParameter)
    {
        name = nameParameter;
    }
    public string GetName()
    {
        return name;
    }

    public void SetNumber(int numberParameter)
    {
        number = numberParameter;
    }
    public int GetNumber()
    {
        return number;
    }
}
~~~~~~~

## Default Values

What if we display the values of the instance variables before setting them?

~~~~~~~
ClassRoom english = new ClassRoom(); 
Console.WriteLine(english.GetName()); // Nothing!
Console.WriteLine(english.GetNumber()); // 0
~~~~~~~

Indeed, instance variables are different from "usual" variables in that sense that they receive a "default" value when created.
This value depends of the variable datatype:

| Type | Default |
| :--: | :--: |
| numerical value | `0` |
| char | `'\x0000'` |
| bool | `false` |
| string | `null` |
<!--
| sbyte, byte, short, ushort, int, uint, long, ulong | `0` | 
| float | `0.0f` |
| double | `0.0d` |
| decimal | `0.0m` |
| object | `null` |
-->

- Note how different it is from the variables we have been using so far, that could not be for instance displayed if their value had not been set.
- We can set a different default value, using, in the class declaration,

~~~~~~~
private string name = "Unknown";
private int number = -1;
~~~~~~~

## Constructors

### Custom

A constructor is a method used to create an object.
It has to have the same name as the class, and doesn't have a return type.

~~~~~~~
public ClassRoom(string nameParameter, int numberParameter)
{
    name = nameParameter;
    number = numberParameter;
}
~~~~~~~~

We use it as follows:

~~~~~~~
ClassRoom math = new ClassRoom("Bertrand", 5);
~~~~~~~


Note:

- the order of the arguments matter,
- the variables, as usual, have a particular scope,
- constructor do not have a return type (not even `void`)


In the UML diagram, we would add:

\+ \<\<constructor\>\> ClassRoom(nameParameter: string, numberParameter: int)

Note that we could skip the  \<\<constructor\>\> part, can you tell why?


### Default

If we implement this constructor, then we lose the "No args", default constructor

~~~~~~~
public ClassRoom() { }
~~~~~~~~~

We can re-define it, using something like:

~~~~~~~
public ClassRoom() {
    name = "Unknown";
    int = -1;
}
~~~~~~~~~


# Signature and Overloading

Every method has a signature made of
- its name, 
- its parameters types (but not the parameter names).

Note that the return type is not part of the method signature in C#. 

In a class, all the methods need to have a different signature.
You cannot, for example, have these two methods in the same class:

~~~~~~~
int DoSomething(int a, int b);
string DoSomething(int c, int d);
~~~~~~~

It is possible, however, to have two methods with the same name, as long as they have different signatures.
If we are in such a situation, then we say that we are _overloading_.
We will look at examples of overloading in lab.

# ToString 

A particular method can be used to display information about our objects. It is called `ToString`, and can be defined as follows:

~~~~~~~
public override string ToString()
{
    return "Person: " + Name + " " + Age;
}
~~~~~~~
