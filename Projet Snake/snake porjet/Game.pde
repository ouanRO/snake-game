import processing.sound.*; //importation de la bibliothèque du son de processing //<>//
// reference : https://youtu.be/I6fG1wneXWo?si=A5werIHWieMjNxpq
SoundFile son;
SoundFile eat;
SoundFile die;


int startTimeGame;
PVector posApple;
int widthUnities;
int heightUnities;
int sizeCel;
String mode;
String setting;
Snake joueur1 ;
Snake joueur2 ;
Cpu computer;
Board board;
Apple apple;
// variables pour la gestion de l'affichage du gagnant et replay
boolean replayClicked = false;
String whoWon;
String testing = "";
// variable pour la verification si le jeu est terminé
boolean gameOver = false;
// variable pour enregistrer le temps de fin de jeu

int start;
int end;
void setup() {

  size(800, 600);
  son = new SoundFile(this, "data/snakeSound.wav");
  eat = new SoundFile(this, "data/snakeEat.wav");
  die = new SoundFile(this, "data/snakeDie.wav");
  sizeCel = 20;
  widthUnities = width / sizeCel;
  heightUnities = height/sizeCel;
  //positions initiales de la pomme et des serpents des joueur1 , joueur2 et cpu
  posApple = new PVector (int(random(widthUnities)), int(random(3, heightUnities)));

  snake1Pos = new PVector(0, 3);
  snake2Pos = new PVector(39, 3);
  cpuPos = new PVector(39, 29);
}

void draw() {

  firstBackground(); // afiche le premier arrière-plan

  if (order[2] == "S") { // vérifie si le joueur a appuyé sur start



    if (order[1].equals("HVH")) { // vérifie si le joueur a choisi de joueur contre un 2ème joueur
      board = new Board( order[0], order[1]); //
      apple = new Apple(posApple); // initialisation de la pomme
      gameSetting();
      checkIn(); // verification des collisions
    } else { // initialisation de jeu pour joueur1 contre l'ordinateur
      board = new Board( order[0], order[1]);

      apple = new Apple(posApple);
      gameSetting();
      checkIn();
    }
  }
  // vérifie si le jeu est terminé
  if (gameOver) {
    finalBackground.display();
    checkIn();
  }
}



void gameSetting() {
  mode = order[1];
  if (order[0] == "HVH") { // joueur1 contre joueur2
    //configuration des paramètres du joueur1 et joueur2
    joueur1 = new Snake(snake1, snake1Pos, board.sizeCel, snake1Direction, color (127));
    joueur1.update(snake1, snake1Speed, snake1Direction, snake1Length, snake1Pos);

    joueur2 = new Snake (snake2, snake2Pos, board.sizeCel, snake2Direction, color(0, 0, 255));
    joueur2.update(snake2, snake2Speed, snake2Direction, snake2Length, snake2Pos);

    apple.eatenApple(snake1Pos, "joueur1");
    apple.eatenApple(snake2Pos, "joueur2");
  }
  if ( order[0] == "HVC") { // joueur contre ordinateur
    joueur1 = new Snake(snake1, snake1Pos, board.sizeCel, snake1Direction, color(127));
    joueur1.update(snake1, snake1Speed, snake1Direction, snake1Length, snake1Pos);

    computer = new Cpu(cpu, cpuPos, board.sizeCel, cpuDirection);
    computer.update(cpu, cpuSpeed, cpuDirection, cpuLength, cpuPos);
    move(posApple);
    // determiner qui a mangé la pomme
    apple.eatenApple(snake1Pos, "joueur1");
    apple.eatenApple(cpuPos, "cpu");
  }
}












// fonction pour gérer les diresctions des serpents avec le clavier
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      snake1Direction = new PVector(0, -1);
    }
    if (keyCode == DOWN) {
      snake1Direction = new PVector(0, 1);
    }
    if (keyCode == LEFT) {
      snake1Direction = new PVector(-1, 0);
    }
    if (keyCode == RIGHT) {
      snake1Direction = new PVector(1, 0);
    }
  }
  if (key == 'z') {
    snake2Direction = new PVector(0, -1);
  }
  if (key == 's') {
    snake2Direction = new PVector(0, 1);
  }
  if (key == 'q') {
    snake2Direction = new PVector(-1, 0);
  }
  if (key == 'd') {
    snake2Direction = new PVector(1, 0);
  }
}

// fonction pour gérer le mouvement de cpu
void move(PVector positionApple) {
  // quand le x du CPU inferieur à celui de la pomme, alors le cpu augmente le x pour y aller ( à droite).
  if (cpuPos.x < positionApple.x) {
    cpuDirection = new PVector(1, 0);
  }
  // quand le y du CPU inferieur à celui de la pomme, alors le cpu augmente le y pour y aller ( en bas).
  if (cpuPos.y < positionApple.y) {
    cpuDirection = new PVector(0, 1);
  }
  if (cpuPos.x > positionApple.x) {
    cpuDirection = new PVector(-1, 0);
  }
  if (cpuPos.y > positionApple.y) {
    cpuDirection = new PVector(0, -1);
  }
}






// fonction qui configure le mécanisme des serpents dans chaque mode
void testColliding(ArrayList <PVector> snakeBody, PVector snakeHead, PVector adversorHead, int snakeLength, int snakeSpeed, ArrayList <PVector> snakeBodyAdversory, String mode, int snakeAdversoryLength) {
  // dans le mode easy
  if (mode.equals("E")) {
    //quand le serpent mange 10 pommes, sa vitesse augmente de 1
    if (snakeLength % 10 == 0) {
      snakeSpeed -= 1;
      //si la vitesse est au max, elle restera toujours la meme
      if (snakeSpeed <= 1) {
        snakeSpeed = 1;
      }
    }
    //le serpent peut resortir de l'autre mur
    if (snakeHead.x < 0) {
      snakeHead.x = widthUnities - 1;
    }
    if (snakeHead.x > widthUnities) {
      snakeHead.x = 0;
    }
    if (snakeHead.y < 3 ) {
      snakeHead.y = heightUnities - 1;
    }
    if (snakeHead.y > heightUnities) {
      snakeHead.y = 3;
    }
  }





  // mode medium
  if (mode.equals("M")) {
    //quand le serpent mange 10 pommes, sa vitesse augmente de 2
    if (snakeLength % 10 == 0) {
      snakeSpeed -= 2;
      if (snakeSpeed <= 1) {
        snakeSpeed = 1;
      }
    }
    //tester si le serpent de joueur 1 touche le mur
    if (isOutOfBounds(snakeHead)) {
      testing = "OOB1";
    }
    //tester si le serpent de joueur 2 touche le mur
    if (isOutOfBounds(adversorHead)) {
      testing = "OOB2";
    }
    //tester si les deux serpents se touchent au niveau de la tete
    if (hasCollidedWithHeadAdversary( snakeHead, adversorHead)) {
      testing = "HCWHA";
    }
    //tester si la tete de serpent touche son corps
    if (hasCollidedWithBody(snakeHead, snakeBody)) {
      testing = "HCWHS";
    }
    //tester si le serpent de joueur 1 touche le corps de son adversaire


    if (hasCollidedWithBody(snakeHead, snakeBodyAdversory)) {
      testing  = "P1HCWBA";
    }
    //tester si le serpent de joueur 2 touche le corps de son adversaire
    if (hasCollidedWithBody(adversorHead, snakeBody)) {
      testing  = "P2HCWBA";
    }
  }
  // mode hard
  if (mode.equals("H")) {
    //quand le serpent mange 10 pommes, sa vitesse augmente de 3
    if (snakeLength % 10 == 0) {
      snakeSpeed -= 3;
      if (snakeSpeed <= 1) {
        snakeSpeed = 1;
      }
    }

    if (isOutOfBounds(snakeHead)) {
      testing = "OOB1";
    }
    if (isOutOfBounds(adversorHead)) {
      testing = "OOB2";
    }
    if (hasCollidedWithHeadAdversary( snakeHead, adversorHead)) {
      testing = "HCWHA";
    }
    if (hasCollidedWithBody(snakeHead, snakeBody)) {
      testing = "P1HCWHS";
    }
    if (hasCollidedWithBody(adversorHead, snakeBodyAdversory)) {
      testing = "P2HCWHS";
    }
    if (hasCollidedWithBody(snakeHead, snakeBodyAdversory)) {
      testing  = "P1HCWBA";
    }
    if (hasCollidedWithBody(adversorHead, snakeBody)) {
      testing  = "P2HCWBA";
    }
  }
}

// fonction qui gère l'entrée et sortie des serpents par les murs
boolean isOutOfBounds(PVector snakeHead) {
  return snakeHead.x > widthUnities - 1 || snakeHead.x < 0 || snakeHead.y > heightUnities - 1 || snakeHead.y < 3;
}

// fonction qui gère la collision des tetes de 2 serpents
boolean hasCollidedWithHeadAdversary(PVector snake1Head, PVector snake2Head ) {
  return snake1Head.x == snake2Head.x && snake1Head.y == snake2Head.y;
}

// fonction qui gère la collision entre la tete d'un serpent et le corps (soit son corps ou celui de son adversaire)
boolean hasCollidedWithBody(PVector snakeHead, ArrayList<PVector> snakeBody) {
  for (int i = 0; i < snakeBody.size(); i++) {
    if (snakeBody.get(i).x == snakeHead.x && snakeBody.get(i).y == snakeHead.y) {
      return true;
    } else if (snakeBody.get(i).x == snakeHead.x && snakeBody.get(i).y == snakeHead.y) {
      return true;
    }
  }
  return false;
}



void checkIn() {
  // conditions dans le mode easy pour finir la partie; le premier serpent qui mange 50 pommes gagne
  if (mode.equals("E")) {
    testColliding(snake1, snake1Pos, snake2Pos, snake1Length, snake1Speed, snake2, mode, snake2Length);
    testColliding(snake2, snake2Pos, snake1Pos, snake2Length, snake2Speed, snake1, mode, snake1Length);
    testColliding(cpu, cpuPos, snake1Pos, cpuLength, cpuSpeed, snake1, mode, snake1Length);

    if ( snake1Length ==50) {
      whoWon = "PLAYER 2";
      endGame();
    }
    if ( snake2Length ==50) {
      whoWon = "PLAYER 1";
      endGame();
    }
    if ( cpuLength ==50) {
      whoWon = "CPU";
      endGame();
    }
  }





  // les conditions dans le mode medium;
  if (mode.equals("M")) {
    if (order[0] == "HVH") {
      testColliding(snake1, snake1Pos, snake2Pos, snake1Length, snake1Speed, snake2, mode, snake2Length);
      testColliding(snake2, snake2Pos, snake1Pos, snake2Length, snake2Speed, snake1, mode, snake1Length);
      if (testing.equals("OOB1")) { // si le premier joueur touche le mur, le 2ème joueur gagne
        die.play();
        whoWon = "PLAYER 1";

        noLoop(); // arret de jeu
        endGame();
      }
      if (testing.equals("OOB2")) { // si le deuxième joueur touche le mur, le premier joueur gagne
        die.play();
        whoWon = "PLYAER 2";

        noLoop();
        endGame();
      }
      if (testing.equals("HCWHA")) { // si les tetes des deux joueur se touchent, les 2 perdent
        die.play();
        whoWon = "they Both Lost";

        noLoop();
        endGame();
      }

      if (testing.equals("P1HCWBA")) { // si la tete du joueur 1 touche le corps de joueur2, ce dernier gagne
        die.play();
        whoWon = "PLAYER 1";

        noLoop();
        endGame();
      }

      if (testing.equals("P2HCWBA")) { // meme codition pour joueur2
        die.play();
        whoWon = "PLAYER 2";

        noLoop();
        endGame();
      }
    }
    if (order[0] == "HVC") {

      testColliding(cpu, cpuPos, snake1Pos, cpuLength, cpuSpeed, snake1, mode, snake1Length);
      testColliding(snake1, snake1Pos, cpuPos, snake1Length, snake1Speed, cpu, mode, cpuLength);
      if (testing.equals("OOB1")) {
        die.play();
        whoWon = "CPU";
        noLoop();
        endGame();
      }
      if (testing.equals("P1HCWBA")) {
        die.play();
        whoWon = "PLAYER 1";

        noLoop();
        endGame();
      }
      if (testing.equals("HCWHA")) { // si les tetes des deux joueur se touchent, les 2 perdent
        die.play();
        whoWon = "they Both Lost";

        noLoop();
        endGame();
      }

      if (testing.equals("P2HCWBA")) {
        die.play();
        whoWon = "CPU";

        noLoop();
        endGame();
      }
    }
  }




  if (mode.equals("H")) {

    if (order[0] == "HVH") {
      testColliding(snake1, snake1Pos, snake2Pos, snake1Length, snake1Speed, snake2, mode, snake2Length);

      if (testing.equals("OOB1")) {
        whoWon = "PLAYER 2";

        noLoop();
        endGame();
      }
      if (testing.equals("OOB2")) {
        whoWon = "PLAYER 1";

        noLoop();
        endGame();
      }
      if (testing.equals("HCWHA")) {
        whoWon = "theyBothLost";

        noLoop();
        endGame();
      }

      if (testing.equals("P1HCWHS")) {


        snake1Length = 0;
        testing = "";
      }

      if (testing.equals("P2HCWHS")) {


        snake2Length = 0;
        testing = "";
      }

      if (testing.equals("P1HCWBA")) { // si le joueur1 touche le corps de joueur2, ce dernier prend ses points (sa longueur), et il redémarre à 0
        snake2Length += snake1Length;
        snake1Length = 0;
        testing = ""; // on reinitialise la variable testing à rien
      }

      if (testing.equals("P2HCWBA")) { // meme condition pour joueur2
        snake1Length += snake2Length;
        snake2Length = 0;
        testing = "";
      }
    }
    if (order[0] == "HVC") {

      testColliding(cpu, cpuPos, snake1Pos, cpuLength, cpuSpeed, snake1, mode, snake1Length);
      // testColliding(snake1 , snake1Pos, cpuPos, snake1Length, snake1Speed, cpu, mode, cpuLength);
      if (testing.equals("OOB2")) {
        whoWon = "CPU";

        noLoop();
        endGame();
      }
      if (testing.equals("HCWHA")) {
        whoWon = "theyBothLost";

        noLoop();
        endGame();
      }



      if (testing.equals("P1HCWHS")) {
        whoWon = "CPU";
        cpuLength = 0;
        testing = "";
      }
      if (testing.equals("P2HCWHS")) {
        whoWon = "CPU";
        snake1Length = 0;
        testing = "";
      }


      if (testing.equals("P1HCWBA")) {
        cpuLength += snake1Length;
        snake1Length = 0;
        testing = "";
      }

      if (testing.equals("P2HCWBA")) {
        snake1Length += cpuLength;
        cpuLength = 0;
        testing = "";
      }
    }
  }
}
// fonction de fin de jeu
void endGame() {
  gameOver = true;
  finalBackground = new FinalBackground( "the winner is : " + whoWon, snake1Length, snake2Length, cpuLength);// classe de fin de jeu
}
