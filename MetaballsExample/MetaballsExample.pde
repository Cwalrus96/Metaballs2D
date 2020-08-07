Metaball metaballs[]; 
final int NUM_METABALLS = 10
  ; 

public void setup()
{
  size(1000, 1000);
  metaballs = new Metaball[NUM_METABALLS];
  for (int i = 0; i < NUM_METABALLS; i++)
  {
    metaballs[i] = new Metaball();
  }
}

public void draw()
{
  background(0); 
  for (Metaball m : metaballs)
  {
    println("updating metaballs"); 
    m.update();
  }
  loadPixels(); 
  for (int x = 0; x < width; x++)
  {
    for (int y = 0; y < height; y++)
    {
      float sum = 0; 
      float r = 0; 
      float g = 0; 
      float b = 0; 
      for (Metaball m : metaballs)
      {
        float contribution = (128 * m.radius) / dist(x, y, m.xPos, m.yPos); //This measures how much each ball contributes to the whole
        sum += contribution; 
        r += m.r * (contribution / 255); 
        g += m.g * (contribution / 255); 
        b += m.b * (contribution / 255);    
      }
      if(sum > 255) sum = 255; 
      if (sum < 255)sum = 0;
      r = r * (sum ) / 255; 
      g = g * (sum)/ 255; 
      b = b * (sum ) / 255; 
      color totalColor = color(r, g, b); 
      pixels[x + y * width] = totalColor;
    }
  }
  updatePixels();
}
