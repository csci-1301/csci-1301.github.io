# foreach Loop
In C#, some objects can store several other objects. Arrays are one of them. The `foreach` statement provides an easy way to execute a statement or a block of statements for each element stored in an object.

## Syntax
The syntax of the _foreach_ statement is as follow:
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

## Some Points About `foreach` 
The _foreach_ statement picks an element from the array and copies it to _ItemName_.
- You are not allowed to change the value of _ItemName_, but if it is a complex object, you can change its member fields and properties.
- You should use `foreach` statement whenever you want to process only one element in each iteration.

### Example 1
In the following example, we define an array of strings. Then, using the foreach statement, we print all the element of the array in the console. Note that to access the elements we **do not use indexes**. 
```
string[] countries = { "USA", "Iran", "China", "Germany", "Canada" };
Console.WriteLine("Here is the list of eligible countries:");
foreach (string CntName in countries)
{
    Console.WriteLine(CntName);
    CntName = "something"; \\ Error: this is not allowed
}
```
### Example 2
In the following example, we use _foreach_ statement to accommodate an array of complex objects without dealing with indexes.
```
Employee[] empArray = new TestClass[5]; \\ Assume we have a class called Employee
foreach(TestClass m in empArray)
{
   Console.Write("Enter the name of the employee:");
   m.Name = Console.ReadLine();  \\ Assume the class Employee has a property called Name
}
```
## `break` and `continue`

As like as the `for` and the `while` statements, you can use the `break` and `continue` statements in a `foreach` loop in the same way.

### Example 3

```
string[] countries = { "USA", "Iran", "China", "Germany", "Canada" };
Console.WriteLine("Enter the name of your country:");
string target = Console.ReadLine();
bool flag = false;
foreach (string CntName in countries)
{
    if(CntName  == target)
    {
        flag = true;
        break;  \\ ends the loop immediately. 
    }
}
if(flag)
{
    Console.WriteLine("Your country is in the list.");
}
else
{
    Console.WriteLine("Sorry!");
}
```
