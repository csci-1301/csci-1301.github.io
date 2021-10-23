class Item
{
  private string description;
  private decimal price;

  public decimal GetPrice()
  {
    return price;
  }
  public void SetPrice(decimal p)
  {
    price = p;
  }
  public string GetDescription()
  {
      return description;
  }
  public void SetDescription(string desc)
  {
      description = desc;
  }
}
