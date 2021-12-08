class Asteroid extends Floater
{
  protected double angVel, radius;
  public Asteroid() {
    radius = Math.random() * 10 + 25;
    setCorners();
    myColor = color(255);
    myCenterX = Math.random() * width;
    myCenterY = Math.random() * height;
    myXspeed = Math.random() * 5 - 2;
    myYspeed = Math.random() * 5 - 2;
    myPointDirection = 0;
    
    angVel = Math.random() * 11 - 5;
  }
  
  public Asteroid(double x, double y)
  {
    this();
    myCenterX = x;
    myCenterY = y;
    
  }
  
  protected void setCorners()
  {
    corners = (int)(Math.random() * 5) + 10;
    float[] angles = new float[corners];
    for (int i = 0; i < angles.length; i++)
    {
      angles[i] = (float)(Math.random() * 2 * Math.PI);
    }
    angles = sort(angles);
    xCorners = new int[corners];
    yCorners = new int[corners];
    for (int i = 0; i < corners; i++)
    {
      xCorners[i] = (int)(Math.sin(angles[i]) * radius);
      yCorners[i] = (int)(Math.cos(angles[i]) * radius);
    }
  }
  
  public void move()
  {
    super.move();
    myPointDirection += angVel;
  }
  
  public boolean collide(double x, double y, double r)
  {
    return dist((float)x, (float)y, (float)myCenterX, (float)myCenterY) < radius + r;
  }
  
  public double getX() {return myCenterX;}
  public double getY() {return myCenterY;}
}
