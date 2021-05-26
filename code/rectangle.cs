class Rectangle
{
    private int length;
    private int width;

    public void SetLength(int lengthParameter)
    {
        length = lengthParameter;
    }
    public int GetLength()
    {
        return length;
    }
    public void SetWidth(int widthParameter)
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