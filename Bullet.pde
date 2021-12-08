class Bullet extends Floater
{
  public Bullet (Spaceship ship)
  {
    myCenterX = ship.getX();
    myCenterY = ship.getY();
    myPointDirection = ship.getDir();
    accelerate(ship.getMag() + 5);
  }
  
  public void show()
  {
    fill(176);
    ellipse((float)myCenterX, (float)myCenterY, 10, 10);
  }
  
  public void move()
  {
    //change the x and y coordinates by myXspeed and myYspeed       
    myCenterX += myXspeed;    
    myCenterY += myYspeed; 
  }
  
  public double getX() {return myCenterX;}
  public double getY() {return myCenterY;}
}
