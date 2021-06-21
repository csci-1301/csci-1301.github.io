# foreach Loop
In C#, some objects can store several other objects. Arrays are one of them. The `foreach` statement provides an easy way to execute a statement or a block of statements for each element stored in an object.

## Syntax
The general syntax of using the _foreach_ statement is as follow:
```
foreach(Type ItemName in CollectionName)
{
   // the code for processing the ItemName
}
```
- **Type**: The type of items in the collection
- **ItemName**: The chosen item is accessible using ItemName
- **CollectionName**: The name of the collection
Since, arrays are the only object that we study in this course, we will use the term array instead of the collections. 
- The _foreach_ statement picks an element from the array and copies it to _ItemName_.
- Note that you are not allowed to change the value of _ItemName_.

## Example
```
string[] contries = { "USA", "Iran", "China", "Germany", "Canada" };
Console.WriteLine("Here is the list of eligible countries:");
foreach (string CntName in contries)
{
    Console.WriteLine(CntName);
}
```
