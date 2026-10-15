int countApple;

class Apple {
  int sizeCel;
  int widthUnities;
  int heightUnities;

  int bonusPunish;

  Apple( PVector posApple ) {
    imageDessine("img/apple.png", 25, 25, 145, 23);


    sizeCel = 20;
    widthUnities = width / sizeCel;
    heightUnities = height/sizeCel;

    imageDessine("img/apple.png", 25, 25, int(posApple.x*sizeCel), int(posApple.y*sizeCel));
  }
  void newApple() { // generer une nouvelle pomme aléatoirement
    fill(150, 127, 60);
    posApple = new PVector (int(random(widthUnities)), int(random(3, heightUnities)));
    imageDessine("img/apple.png", 25, 25, int(posApple.x*sizeCel), int(posApple.y*sizeCel));
  }
  
  //une fonction qui attribut soit un bonus ( +1/2 de sa lengueur) ou punition (-1/2 de sa longueur)
  void eatenApple(PVector posPlayer, String whoAteMe) {
    bonusPunish = int(random(0,2));

    if ( posPlayer.x == posApple.x && posPlayer.y == posApple.y) {
      eat.play(); // pour generer le son quand il mange la pomme
      newApple();
      countApple++; 
      

      if (whoAteMe == "joueur1") {
        if (countApple % 5 == 0) { // toutes les cinqs pommes on genere un bonus
          if (bonusPunish == 0) { // aléatoirement soit 0 pour ajouter soit 1  pour diminuer
            snake1Length = snake1Length + snake1Length/2;
          }
          if (bonusPunish == 1) {
            snake1Length = snake1Length - snake1Length/2;
          }
          
        } else {
          snake1Length++;
        }
      } else if (whoAteMe == "joueur2") {
        if (countApple % 5 == 0) {
          if (bonusPunish == 0) {
            snake2Length = snake2Length + snake2Length/2;
          }
          if (bonusPunish == 1) {
            snake2Length = snake2Length - snake2Length/2;
          }
          
        } else {
          snake2Length++;
        }
      } else {
        if (countApple % 5 == 0) {
          if (bonusPunish == 0) {
            cpuLength = cpuLength + cpuLength/2;
          }
          if (bonusPunish == 1) {
            cpuLength = cpuLength - cpuLength/2;
          }
        } else {
          cpuLength++;
        }
      }
    }
  }
}
