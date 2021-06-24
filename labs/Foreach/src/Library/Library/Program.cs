using System;

class Program
{
    public static void Main()
    {
        // declare an array that holds books
        Book[] books = new Book[10];
        
        // fill array with books
        books[0] = new Book("The Great Gatsby", 1925);
        books[1] = new Book("Don Quixote", 1605);
        books[2] = new Book("Catch-22", 1961);
        books[3] = new Book("Harry Potter and the Philosopher's Stone", 1997);
        books[4] = new Book("The Lord of the Rings", 1954);
        books[5] = new Book("Things Fall Apart", 1958);
        books[6] = new Book("Great Expectations", 1861);
        books[7] = new Book("1984", 1949);
        books[8] = new Book("The Metamorphosis", 1915);
        books[9] = new Book("One Hundred Years of Solitude", 1967);
        

    }
}
