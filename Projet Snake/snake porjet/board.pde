// classe dédiée au plateau de jeu
class Board {
  int timeLimit;

  boolean gameEnd;
  PImage coupeOr; // image de la coupe
  String newTop; // le nouveau score le plus élevé
  int sizeCel;
  int widthUnities;
  int heightUnities;
  
  Board( String setting, String modeG) { // nous avons ajouté les length des snake dans les parametre de bord pour les mettre dans le board

    
    background(165, 205, 0);
    sizeCel = 20;
    widthUnities = width / sizeCel; // diviser le width sur sizeCel pour obtenir le nombre des cellules proportionelles à l'écran.  
    heightUnities = height/sizeCel;
    for (int i = 0; i < width; i++) {// on utilise la largueur complete
      for (int j = 3; j < height; j++) {// on utilise la longueur moins les trois premieres cellules qui sont reservées pour le menu
        if ( (i +j) % 2 == 0) {
          fill(165, 205, 0); // remplissage des cellules avec deux couleurs
        } else {
          fill(187, 225, 0);
        }
        noStroke();
        rect(i*sizeCel, j*sizeCel, sizeCel, sizeCel);
      }
      stroke(187, 225, 0);
      line(0, 60, width, 60);
    }

    imageDessine("img/manette.png", 60, 40, 17, 14);// décoration du   menu
    imageDessine("img/manette.png", 60, 40, 207, 14);
    imageDessine("img/appleB.png", 25, 25, 145, 23);
    imageDessine("img/appleB.png", 25, 25, 335, 23);


    if (setting.equals("HVH")) { 
      drawFont(15, 115, 13, "Player 1", color(0));
      drawFont(20, 115, 40, str(snake1Length), color(0));
      drawFont(15, 305, 13, "Player 2", color(0));
      drawFont(20, 305, 40, str(snake2Length), color(0));
      
    } else {
      drawFont(15, 115, 13, "Player 1", color(0));
      drawFont(20, 115, 40, str(snake1Length), color(0)); 
      drawFont(15, 305, 13, "CPU", color(0));
      drawFont(20, 305, 40, str(cpuLength), color(0));
    }
    drawLine();
    
    
    
    
    
    
    drawFont(20, 770, 40, str((millis() - startTime) / 1000), color(0));
    drawFont(15, 700, 40, "PLAYED TIME : ", color(0));
   


    imageDessine("img/coupeOr.png", 40, 40, 400, 4);
    
  }
}



// fonction pour simplifier le processus d'affichage de texte

void drawFont(int sizeFont, int posXFont, int posYFont, String text, color colorFont) {
  fill(colorFont);
  textAlign(CENTER, CENTER);

  textFont(createFont("Arial", sizeFont, true));
  text(text, posXFont, posYFont);
}
// fonction qui facilite l'utilisation des images
void imageDessine(String chemainAcces, int sizeX, int sizeY, int posX, int posY) {
  PImage img;
  img = loadImage(chemainAcces);
  img.resize(sizeX, sizeY);
  image(img, posX, posY);
}




void drawLine() {

  stroke(0);
  strokeWeight(2);
  line(637, 27, 795, 27);
  line(637, 53, 795, 53);
  line(637, 27, 637, 53);
  line(795, 27, 795, 53);
}
