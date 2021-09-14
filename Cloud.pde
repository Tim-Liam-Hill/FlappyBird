
PImage cloud1; // will have to change system of clouds if various designs implemented

class Cloud{
  
  PVector pos;
  float cloudSpeed;    //clouds can move at different speeds
  final int upperSize = 100;
  final int lowerSize = 50;
  int size;
  
  
  Cloud(int x, int y){
    pos = new PVector(x, y); 
    
    //can change so that cloud is one of multiple designs
    cloud1 = loadImage("Cloud1.png");
    size = int(random(lowerSize, upperSize));
    cloudSpeed = random(1, 4);
  }
  
  void drawCloud()
  {
    imageMode(CENTER);
    image(cloud1, pos.x, pos.y, size, size);
  }
  
  void updateCloud()
  {
    pos.x -= cloudSpeed;

  }
  
  boolean isOffScreen()
  {
    if(pos.x <= -80)
      return true;
    
   return false; 
  }
  
}
