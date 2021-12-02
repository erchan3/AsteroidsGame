class Asteroid extends Floater
{
  private double angVel, radius;
  public Asteroid() {
    radius = Math.random() * 15 + 15;
    corners = (int)(Math.random() * 5) + 10;
    double[] angles = new double[corners];
    for (int i = 0; i < angles.length; i++)
    {
      angles[i] = Math.random() * 2 * Math.PI;
    }
    angles = sort(angles);
    xCorners = new int[corners];
    yCorners = new int[corners];
    for (int i = 0; i < corners; i++)
    {
      xCorners[i] = (int)(Math.sin(angles[i]) * radius);
      yCorners[i] = (int)(Math.cos(angles[i]) * radius);
    }
    myColor = color(255);
    myCenterX = Math.random() * width;
    myCenterY = Math.random() * height;
    myXspeed = Math.random() * 7 - 3;
    myYspeed = Math.random() * 7 - 3;
    myPointDirection = 0;
    
    angVel = Math.random() * 11 - 5;
  }
  
  public Asteroid(double x, double y)
  {
    this();
    myCenterX = x;
    myCenterY = y;
    
  }
  
  @Override
  public void move()
  {
    super.move();
    myPointDirection += angVel;
  }
  
  public boolean collide(Spaceship ship)
  {
    return dist((float)ship.getX(), (float)ship.getY(), (float)myCenterX, (float)myCenterY) < radius + 6;
  }
}
