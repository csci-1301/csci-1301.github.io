class Book
{
    private string title;
    private int year;
    
    public Book(string titleParam, int yearParam) {
        title = titleParam;
        year = yearParam;
    }

    public string GetTitle()
    {
        return title;
    }

    public int GetYear()
    {
        return year;
    }

    public override string ToString()
    {
        return $"Title: {title}\nYear:  {year}\n";
    }
}