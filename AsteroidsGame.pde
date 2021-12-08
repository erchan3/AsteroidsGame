Spaceship ship;
Star[] stars = new Star[100];
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();

public void setup() 
{
  size(800, 600);
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
  for (int i = bullets.size() - 1; i >= 0; i--)
  {
    bullets.get(i).show();
    bullets.get(i).move();
    double x = bullets.get(i).getX();
    double y = bullets.get(i).getY();
    if (x < 0 || x > width || y < 0 || y > height)
    {
      bullets.remove(i);
    }
  }
  for (int i = asteroids.size() - 1; i >= 0; i--)
  {
    asteroids.get(i).show();
    asteroids.get(i).move();
    
    // check if asteroid collides with spaceship and remove if yes
    if (asteroids.get(i).collide(ship.getX(), ship.getY(), 6))
    {
      asteroids.remove(i);
      asteroids.add(new Asteroid(0, 0));
      continue;
    }
    for (int j = bullets.size() - 1; j >= 0; j--)
    {
      if (asteroids.get(i).collide(bullets.get(j).getX(), bullets.get(j).getY(), 5))
      {
        Asteroid removed = asteroids.remove(i);
        if (!(removed instanceof AsteroidSmall))
        {
          asteroids.add(new AsteroidSmall(removed.getX(), removed.getY(), false));
          asteroids.add(new AsteroidSmall(removed.getX(), removed.getY(), true));
        }
        else if (((AsteroidSmall)removed).spawnNew())
        {
          asteroids.add(new Asteroid(0, 0));
        }
        bullets.remove(j);
        break;
      }
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
     ship.setAcc(0.07);
  }
  if (key == ' ')
  {
    bullets.add(new Bullet(ship));
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
