Spaceship ship;
Star[] stars = new Star[100];
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();

public void setup() 
{
  size(800, 800);
  ship = new Spaceship();
  for (int i = 0; i < stars.length; i++)
  {
    stars[i] = new Star();
  }
  for (int i = 0; i < 10; i++)
  {
    asteroids.add(new Asteroid());
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
  for (int i = asteroids.size() - 1; i >= 0; i--)
  {
    asteroids.get(i).show();
    asteroids.get(i).move();
    
    // check if asteroid collides with spaceship and remove if yes
    if (asteroids.get(i).collide(ship))
    {
      asteroids.remove(i);
      asteroids.add(new Asteroid(0, 0));
    }
    
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
