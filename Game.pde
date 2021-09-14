

class Game{
  
  int score;
  ArrayList<PipePair> pipes;
  final int pipeSpawnControlDistance = 350; // pipes must travel this distance before new pipe can spawn
  Bird player;
  boolean gameIsOver;
  Sky sky;
  
  
  Game()
  {
    score = 0;
    gameIsOver = true;
    pipes = new ArrayList<PipePair>();
    player = new Bird();
    sky = new Sky();
    
    
  }
  
  //---Game Handling Functions----------
  
  void displayElements()
  {
    sky.displayClouds();
    player.drawBird();
    
    for(int i=0; i<pipes.size(); ++i)
    {
       pipes.get(i).drawPipePair(); 
    }
    
    this.displayScore();
  }
  
  void updateElements()
  {
    sky.updateClouds();
    player.updateBird();
    
     for(int i=0; i<pipes.size(); ++i)
    {
       pipes.get(i).updatePipePair(); 
       removePastPipePair();
    }
    this.checkIfSpawnPipePair();    //should have created a seperate class to handle all pipes
    this.removePastPipePair();      //thankfully this is a simple game to program
    
     if( pipes.get(0).scoreUp(player)) //there is probably a more efficient way to handle score checking
     {
      score++; 
     }
     //NB note the above function only works correctly provided pipes are a certain distance apart
  }
  
  void checkIfGameOver()  
  {
    if( player.checkIfCollided(pipes))
      gameIsOver = true;
     
     if(player.checkIfOffScreen())
       gameIsOver = true;
  }
  
  void resetGame()
  {
    player.resetBird();
    for(int i =0; i< pipes.size(); ++i)
    {
      pipes.remove(i);
    }
    
    score = 0;
  }
  
  //-----Bird specific functions
  
  void accelerateBird()
  {
    player.accelerate();
  }
  
  //-----PipePair specific functions
  
  
  void checkIfSpawnPipePair()
  {
    if(pipes.size() == 0)  //if no pipes then spawn a pair
    {
      PipePair newPipe = new PipePair();
      pipes.add(newPipe);
    }
    else if(pipes.size() >= 1) // must make sure pipes dont spawn too close together
    {
      
      boolean canSpawn = true;
      
      for(int i=0; i < pipes.size(); ++i)  
      {
        if(pipes.get(i).pos.x >= width - pipeSpawnControlDistance)
          canSpawn = false;
          
      }
      
      if(canSpawn)
      {
        PipePair newPipe = new PipePair();
        pipes.add(newPipe);
      }
    }
  }
  
  void removePastPipePair()          
  {
    //only going to check first element 
    if(pipes.get(0).pos.x <= -(pipes.get(0).pipeWidth) )
      pipes.remove(0);
    
  }
  
  
  //---display things for aesthetics
  
  void displayScore()
  {
    textSize(40);
    fill(#DBFA19);
    text(score, 20, 34);
    
    if(gameIsOver)
    {
      
     textSize(60);
     fill(#CE0F28);
     text("GAME OVER", width/2 - 130, height/2);
      
    }
  }
  
}
