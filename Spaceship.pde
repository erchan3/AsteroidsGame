class Spaceship extends Floater  
{   
  private double myWLeft, myWRight, myA; // angular velocity, acceleration
  public Spaceship()
  {
    xCorners = new int[]{-8, 16, -8};
    yCorners = new int[]{-8, 0, 8};
    corners = xCorners.length;
    myColor = color(255);
    myCenterX = width / 2.0;
    myCenterY = height / 2.0;
    myXspeed = myYspeed = 0;
    myPointDirection = 0;
  }
  
  public void turn ()
  {
    super.turn(myWLeft + myWRight);
    if (myPointDirection < 0)
    {
      myPointDirection -= 360 * (int)(myPointDirection / 360 - 1);
    } else if (myPointDirection >= 360)
    {
      myPointDirection %= 360;
    }
  }
  
  public void accelerate()
  {
     super.accelerate(myA); 
  }
  
  public void setWLeft(double w)
  {
    myWLeft= w;
  }
  
  public void setWRight(double w)
  {
    myWRight = w;
  }
  
  public void setAcc(double a)
  {
    myA = a;
  }
  
  public void hyperSpace()
  {
    myCenterX = Math.random() * width;
    myCenterY = Math.random() * height;
    myXspeed = myYspeed = 0;
    myPointDirection = Math.random() * 360;
  }
  
  public void show()
  {
    fill(myColor);   
    stroke(myColor);    
    
    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    
    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);

    if (myA > 0)
    {
      fill(206, 57, 4);
      stroke(206, 57, 4);
      beginShape();
      vertex(-11, -5);
      vertex(-20, -7);
      vertex(-15, -3);
      vertex(-22, 0);
      vertex(-15, 3);
      vertex(-20, 7);
      vertex(-11, 5);
      endShape(CLOSE);
    }
    
    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }
  
  public double getX() {return myCenterX;}
  public double getY() {return myCenterY;}
}
