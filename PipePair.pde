

class PipePair{
  
  PVector pos;
  int upperLimit;
  int lowerLimit;
  int pipeWidth = 25;
  int pipeGap = 175;
  boolean passedPlayer;
  
  PipePair()
  {
    pos = new PVector(500,0);
    upperLimit = int(random(100, 505)); 
    lowerLimit = upperLimit + pipeGap;
    passedPlayer = false;
  }  
  
  void drawPipePair()
  {
    //top pipe first
    //fill(255, 0, 0);
    //rect(pos.x, 0, pipeWidth, upperLimit);
    
    imageMode(CORNER);
    PImage topPipe;
    topPipe = loadImage("TopPipe.png");
    image(topPipe, pos.x - 12, 0, pipeWidth *2 , upperLimit );
    
    //bottom pipe next
    //rect(pos.x, lowerLimit, pipeWidth, 700 - lowerLimit);
    
    PImage bottomPipe = loadImage("BottomPipe.png");
    image(bottomPipe, pos.x -12, lowerLimit, pipeWidth * 2, 700 - lowerLimit);
    
  }
  
  void updatePipePair()
  {
    pos.x -= 3;
  }
  
  boolean scoreUp(Bird player)
  {
    if(pos.x + pipeWidth < player.xPos - player.diameter/2)
    {
     if(!passedPlayer) 
     {
      passedPlayer = true;
      return true;
     }
    }
    
    return false;
  }
 
}
