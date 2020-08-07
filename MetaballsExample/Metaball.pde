class Metaball {
  float xPos, yPos, radius, dx, dy; 
  color ballColor; 
  float r, g, b; 

  public Metaball()
  {
    xPos = random(0, width);
    yPos = random(0, height); 
    dx = random(5, 25); 
    dy = random(5, 25); 
    radius = random(50, 200);
    r = random(0, 255); 
    g = random(0, 255); 
    b = random(0, 255); 
    ballColor = color(r, g, b); 
    if(r > g && r > b)
    {
      if(g > b)
      {
         b = 0;  
      }
      else
      {
         g = 0;  
      }
    }
    else if(g > b) {
       if(r > b) 
       {
          b = 0;  
       }
       else r = 0; 
    }
    else if(r > g) g = 0; 
    else r = 0; 
  }

  public void update()
  {
    xPos += dx; 
    yPos += dy; 
    println("xPos = " + xPos + ", yPos = " + yPos + ", x velocity = " + dx + ", y velocity = " + dy); 
    if (xPos >= width || xPos <= 0)
    {
      dx = dx * -1;
    }
    if (yPos >= height || yPos <= 0)
    {
      dy = dy * -1; 
    }
    //noFill(); 
    //stroke(255);
    //ellipse(xPos, yPos, radius * 2, radius * 2); 
  }
}
