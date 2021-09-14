


PImage background;
Game currentGame;
float gravity;

void setup(){
  background(0);
  size(500, 700);
   currentGame = new Game();
  frameRate(60);
  smooth();
  
  //---game specific things---
  gravity = 1;
  background = loadImage("FlappyBirdBackground.jpg");
}

void draw(){
  imageMode(CORNER);
  image(background, 0, 0);
  
  if(!currentGame.gameIsOver)
  {
    currentGame.displayElements();
    currentGame.updateElements();
    currentGame.checkIfGameOver();
    currentGame.displayScore();
  }
  else
  {
    currentGame.displayElements();
    currentGame.displayScore();
    
  }
  
}


//-----------key pressed function--------


void keyPressed(){
  
  if(!currentGame.gameIsOver)
  {
    currentGame.accelerateBird();
  }
  else
  {
    currentGame.resetGame();
    currentGame.gameIsOver = false;
  }
  
  
  
}
