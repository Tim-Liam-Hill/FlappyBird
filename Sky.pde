

class Sky{
  
  ArrayList<Cloud> cloudList;
  int timer;
  final int cloudSpawnRate = 5;
  final int lowerLimit = 30;
  final int upperLimit = 200;
  final int secondsWait = 3;
  
  Sky(){
    timer =0;
    cloudList = new ArrayList<Cloud>();
  }
  
  void displayClouds()
  {
    for(int i=0; i< cloudList.size(); ++i)
    {
       cloudList.get(i).drawCloud(); 
    }
  }
  
  void updateClouds()
  {
    for(int i=0; i< cloudList.size(); ++i)
    {
       cloudList.get(i).updateCloud(); 
    }
    
    this.spawnCloud();
    this.removePastCloud();
  }
  
  void spawnCloud()
  {
    if(timer == 0)
    {
      if(random(0, 100) < cloudSpawnRate)
      {
        Cloud newCloud = new Cloud(600, int(random(lowerLimit, upperLimit)));
        cloudList.add(newCloud);
        
        if(random(0, 100) <40)
        {
          timer = int(frameRate) * secondsWait;   //makes sure there is a delay between cloud spawns
        }
      }
    }
    else
    {
     timer --; 
      
    }
    
  }
  
  void removePastCloud()
  { 
   for(int i=0; i< cloudList.size() ; ++i)  //checking all clouds just to be safe although cheking first cloud should
   {                                        // achieve the same purpose more efficiently
     if(cloudList.get(i).isOffScreen())
       cloudList.remove(i);
       System.out.println(cloudList.size()); //delete me
   }
  }
  
}
