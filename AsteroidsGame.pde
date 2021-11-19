Spaceship ship;
Star[] stars = new Star[100];

public void setup() 
{
  size(500, 500);
  ship = new Spaceship();
  for (int i = 0; i < stars.length; i++)
  {
    stars[i] = new Star();
  }
}

public void draw() 
{
  background(50);
  ship.show();
  ship.move();
  ship.turn();
  ship.accelerate();
  
  for (Star star : stars)
  {
    star.show();
  }
}

public void keyPressed()
{
  if (key == 'a')
  {
    ship.setWLeft(-8);
  }
  if (key == 'd')
  {
    ship.setWRight(8);
  }
  if (key == 'w')
  {
     ship.setAcc(0.1);
  }
}

public void keyReleased()
{
  if (key == 'a')
  {
    ship.setWLeft(0);
  }
  if (key == 'd')
  {
    ship.setWRight(0);
  }
  if (key == 'w')
  {
     ship.setAcc(0);
  }
  if (key == 'h')
  {
    ship.hyperSpace();
  }
}
