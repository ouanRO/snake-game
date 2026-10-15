//initialisation des serpents des 2 joueurs, meme configurations que le cpu
ArrayList<PVector> snake1 = new ArrayList<PVector>();
PVector snake1Pos;
PVector snake1Direction = new PVector (0, 0);
int snake1Length = 0;
int snake1Speed = 1;


ArrayList<PVector> snake2 = new ArrayList<PVector>();
PVector snake2Pos;
PVector snake2Direction = new PVector (0, 0);
int snake2Speed = 1;
int snake2Length = 0;

class Snake {
  PVector snakePos;
  PVector snakeDirection;
  int snakeLength;
  int snakeSpeed;
  // meme mecanisme du CPU
  Snake(ArrayList <PVector> snake, PVector snakePos, int sizeCel, PVector snakeDirection , color snakeColor) {
    fill(snakeColor);
    noStroke();
    rect(snakePos.x  *sizeCel, snakePos.y*sizeCel, sizeCel, sizeCel, 10);
    if (snakeDirection.x == -1 ) {
      fill(255);
      ellipse((snakePos.x*sizeCel) +5, snakePos.y*sizeCel + 5, 5, 5);
      ellipse((snakePos.x*sizeCel) +5, snakePos.y*sizeCel + 15, 5, 5);
    } else if (snakeDirection.x == 1 ) {
      fill(255);
      ellipse((snakePos.x*sizeCel) + 15, snakePos.y*sizeCel + 5, 5, 5);
      ellipse((snakePos.x*sizeCel) + 15, snakePos.y*sizeCel + 15, 5, 5);
    } else if (snakeDirection.y == 1 ) {
      fill(255);
      ellipse((snakePos.x*sizeCel) + 5, snakePos.y*sizeCel + 15, 5, 5);
      ellipse((snakePos.x*sizeCel) + 15, snakePos.y*sizeCel + 15, 5, 5);
    } else if (snakeDirection.y == -1 ) {
      fill(255);
      ellipse((snakePos.x*sizeCel) + 5, snakePos.y*sizeCel + 5, 5, 5);
      ellipse((snakePos.x*sizeCel) + 15, snakePos.y*sizeCel + 5, 5, 5);
    }
    for (int i = 0; i < snake.size(); i++) {
      fill(snakeColor);
      rect(snake.get(i).x * sizeCel, snake.get(i).y*sizeCel, sizeCel, sizeCel);
    }
  }



  void update(ArrayList <PVector> snake, int snakeSpeed, PVector snakeDirection, int snakeLength, PVector snakePos) {
    if (frameCount % snakeSpeed == 0) {
      snake.add(new PVector(snakePos.x, snakePos.y));
      while (snake.size() > snakeLength) {
        snake.remove(0);
      }
      snakePos.add(snakeDirection);
    }
  }
  
  
}
