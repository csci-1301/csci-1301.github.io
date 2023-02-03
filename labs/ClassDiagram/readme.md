---
title: UML Class Diagram
---

This lab serves multiple goals:

- To give you a general understanding of the purpose of UML diagrams,
- To help you read simple UML class diagrams,
- To help you match a UML diagram with its implementation,
- To transform an informal class description into a UML class diagram.

# Introduction

Quoting [wikipedia](https://en.wikipedia.org/wiki/Unified_Modeling_Language),

> The Unified Modeling Language (UML) is a general-purpose, developmental, modeling language in the field of software engineering that is intended to provide a standard way to visualize the design of a system.

Stated differently, it is a tool for visually representing programs and their deployment. 
UML uses many different types of diagrams to represent different aspects of systems and software.
In this lab you will practice interpreting and creating one of them: a _class diagram_. 

# Interpreting a UML class diagram

## Reading the diagram

Study the following diagram, then answer follow up questions:

```text
|===========================================|
|                 Account                   |
|-------------------------------------------|
| - balance : decimal                       |
|-------------------------------------------|
| + GetBalance():decimal                    |
| + DisplayBalance():void                   |
| + AddFunds(amount:decimal):void           |
| + Withdraw(amount:decimal):void           |
|===========================================|
```

#. What is the name of this class?
#. How many attributes does this class have?
#. What is the data type of `balance`?
#. How many methods does this class have?
#. What is the significance of `+` and `-` in the diagram?
#. You will notice that there are two similar methods: `GetBalance` and `DisplayBalance`
    - based on the name can you interpret the behavior of these methods?
    - can you think of _why_ we might need two such similar methods?

<details><summary>Solution:</summary>
- The name of the class is "Account",
- This class has only one attribute, called `balance` and of type `decimal`,
- This class has 4 methods.
- The symbol `+` is used to signify that the member (be it a method or an attribute) is public. The symbol `-` is used to indicate a private member. In general, in this course, we will let attributes be private and methods be public.
- The `GetBalance` method will returns the actual balance, while `DisplayBalance` will simply display the balance (and not return anything, since its return type is `void`).
We may need two different methods as one will be used to make computations (`GetBalance`) while the other will be used to display nicely the information (`DisplayBalance`).
</details>

## Implementing the class

Class diagram provides a concise way to represent attributes and methods, but it does not explain the implementation of the methods.

Knowing that:

#. `GetBalance` returns the current value of balance,
#. `DisplayBalance` displays the current balance at the screen formatted as currency, 

    for example:

    ```text
    Your current balance is $1,000,000.00 dollars!
    ``` 
    
#. `AddFunds` increments the current balance value by specified `amount`, and
#. `Withdraw` reduces balance by specified `amount`.

implement your version of this class in C\#. For completeness, after you are done you should
instantiate an object of the class and ensure it works as described.

# Creating your own class diagram 

In this next exercise you will practice drawing your own diagram, on paper.
Draw the UML diagram of the following class:

#. The class is named `Rectangle`.
#. It has two attributes: `width` and `length`, both of type `int`
#. It has eight methods:
    - two setters, two getters (i.e., one for each attribute) 
    - `ComputeArea` method to compute the area of a rectangle
    - `ComputePerimeter` method to compute the perimeter of a rectangle
    - `Swap` method to swap the length and the width of a  rectangle
    - `Multiply` method to multiply the length *and* width of a rectangle by an ratio given in argument as an integer (`int`).
    
<details><summary>Solution:</summary>
You can check your answer, by referring back to the `Rectangle.cs` file from the ["Enriched Rectangle" project](../Rectangle/Enriched_Rectangle.zip). The UML diagram for this class is indicated, in comments, at the beginning of the file (but misses the `Multiply` method).
</details>

# Pushing Further (Optional)

The following is an independent task, to widen your understanding of UML modelling concepts:

#. Class diagrams are just a special case of UML diagram. Have a look at <https://en.wikipedia.org/wiki/Unified_Modeling_Language#Diagrams>. In which category are class diagrams: behavior, or structure diagram?
#. Besides modelling attributes and methods, class diagrams can also represent relationships between classes. Have a look at <https://en.wikipedia.org/wiki/Class_diagram> for more examples of class diagrams and its uses.
#. Activity Diagram is another type of UML diagram for representing program actions. You will occasionally see activity diagrams in the lecture notes. Have a look at <https://en.wikipedia.org/wiki/Activity_diagram> and try to understand the example: "Activity diagram for a guided brainstorming process".s
