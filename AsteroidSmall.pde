class AsteroidSmall extends Asteroid
{
  private boolean willSpawnNew;
  AsteroidSmall(double x, double y, boolean spawner)
  {
    super(x, y);
    radius = Math.random() * 10 + 15;
    setCorners();
    willSpawnNew = spawner;
  }
  
  public boolean spawnNew()
  {
    return willSpawnNew;
  }
}
