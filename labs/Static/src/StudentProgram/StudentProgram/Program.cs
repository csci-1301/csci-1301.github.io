using System;

class Program {
    static void Main() {

        Student alice = new Student(1111, "Alice");
        Console.WriteLine(alice);

        Student.DisplayStudentCount(); // first time

        Student bob = new Student(1112, "Bob");        
        Console.WriteLine(bob);

        Student.DisplayStudentCount(); // second time
    }
}