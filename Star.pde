class Star //note that this class does NOT extend Floater
{
  private int x, y, r;
  
  public Star() {
    x = (int)(Math.random() * width);
    y = (int)(Math.random() * height);
    r = (int)(Math.random() * 4) + 1;
  }
  
  public void show()
  {
    stroke(255);
    fill(255);
    ellipse(x, y, r, r);
  }
}
