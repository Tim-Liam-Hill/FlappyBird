PImage birdSprite, birdSpriteFlap; // piskel was used to create sprite for bird

class Bird{
  
  PVector pos;      
  PVector velocity;
  final int xPos = 80;
  final int diameter = 30;
  float angleOfRotation;
 
  
  int counter; 
  
  Bird()
  {
    pos = new PVector(xPos, 300);
    velocity = new PVector(0, 0);
    birdSprite = loadImage("FlappyBird.png");
    birdSpriteFlap = loadImage("FlappyBirdFlap.png");
    angleOfRotation = 0;
  }
  
  void drawBird()
  {
   fill(0, 255, 0);
   //ellipse(xPos, pos.y, diameter, diameter); this is the hitbox
   
   pushMatrix();
   translate(xPos, pos.y);
   rotate(radians(angleOfRotation));
   imageMode(CENTER); 
   
   if(angleOfRotation >= -20)
   {
     image(birdSprite, 0, 0, 68, 68);
   }
   else
   {
     image(birdSpriteFlap, 0, 0, 68, 68);
   }
   translate(0, 0);
   popMatrix();
    
  }
    
  void updateBird()
  {
    pos.y += velocity.y;
    velocity.y += gravity;
    angleOfRotation += gravity;
  }
  
  void accelerate()
  {
   velocity.y = -14; 
   angleOfRotation = -30;
    
  }
  
  boolean checkIfCollided(ArrayList<PipePair> pipes)
  {
    for(int i=0; i< pipes.size(); ++i)
    {
      if( xPos + diameter/2 >= pipes.get(i).pos.x &&  xPos - diameter/2 <= pipes.get(i).pos.x + pipes.get(i).pipeWidth)
      {
        if( pos.y - diameter/2 <= pipes.get(i).upperLimit || pos.y + diameter/2 >= pipes.get(i).lowerLimit )
        {
          return true; 
        }
        
      }
    }
    
    return false;
  }
  
  boolean checkIfOffScreen()
  {
    if(pos.y - diameter/2 <= 0)
      return true;
    if(pos.y + diameter/2 >= height)
      return true;
      
     return false; 
    
  }
  
void resetBird()
  {
    pos.y = 300;
    velocity.y = 0;
  }
  
  
}
