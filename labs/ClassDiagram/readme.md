---
title: Class Diagram
---


**Unified Modeling Language** (UML) is a tool for visually representing programs. 
UML is used to represents many different [types of diagrams](https://en.wikipedia.org/wiki/Unified_Modeling_Language#Diagrams).
In this lab you will practice interpreting and creating one of them: a _class diagram_. 

# Interpreting a UML class diagram

Study the following diagram, then answer follow up questions:

!["Class diagram for a bank account"](./img/account_class.png)

#. What is the name of this class?
#. How many attributes does this class have?
#. How many methods does this class have?
#. You will notice that there are two similar methods: `GetBalance` and `DisplayBalance`
    - based on the name can you interpret the behavior of these methods?
    - can you think of _why_ we might need such similar methods?

Class diagram provides a concise way to represent attributes and methods, but it does not explain the implementation of the methods.

Knowing that:

#. `GetBalance` method returns the current value of balance,
#. `DisplayBalance` will display the current balance at the screen formatted as currency, for example:

    ```text
    Your current balance is $1,000,000.00 dollars!
    ``` 
    
#. `AddFunds` increments the current balance value by specified `amount`, and
#. `Withdraw` performs following operation:
    - if sufficient funds are available, it reduces balance by specified amount and returns `true` to indicate withdrawl succeeded
    - if funds are insufficient, it does nothing to balance, and returns `false`

implement your version of this class in C\#.

# Writing your own class diagram 

In this next exercise you will practice drawing your own diagram, on paper.

#. Draw the UML class diagram of a PreciseRectangle class.
#. It should have two attributes: `width` and `length` of type `double`
#. It should have eight methods:
    - two setters, two getters (i.e., one for each attribute) 
    - one method to compute the area of a precise rectangle
    - one method to compute the perimeter of a precise rectangle
    - one method to swap the length and the width of a precise rectangle
    - one method to multiply the length and width of a precise rectangle by an ratio given in argument as an integer


# Pushing Further (Optional)

The following is an independent task, to widen your understanding of UML modelling concepts:

#. Class diagrams are just a special case of UML diagram. 
   Have a look at <https://en.wikipedia.org/wiki/Unified_Modeling_Language#Diagrams>.
   In which category are class diagrams: behavior, or structure diagram?
   
#. Besides attributes and methods, class diagrams can also represent relationships between classes.  
   Have a look at <https://en.wikipedia.org/wiki/Class_diagram/> for more examples of class diagrams.

#. Activity Diagram is another type of UML diagram for representing program actions. 
   You will occasionally see activity diagrams in the lecture notes.

   !["A flowchart representation of an if-else statement"](./img/activity_diag_vote_if_else)
    
   Have a look at <https://en.wikipedia.org/wiki/Activity_diagram> and try to 
   understand the example: "Activity diagram for a guided brainstorming process".

