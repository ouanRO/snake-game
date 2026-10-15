int startTime;
String [] order = new String[3];
PImage img;
class BackgroundStart {
  PFont f;

  BackgroundStart(String chaine, PVector chianePos, int sizeChaine, PVector rectPropo, color carreeColor ) {
    f = createFont("Arial", 16, true);
    textFont(f, sizeChaine);
    noStroke();
    fill(carreeColor);
    rect(chianePos.x, chianePos.y, rectPropo.x, rectPropo.y, 10);
    fill(255);
    textAlign(CENTER, CENTER);
    text(chaine, chianePos.x + rectPropo.x/2, chianePos.y + rectPropo.y/2);
  }
  

}

color MGColor = color(0, 127);
color HVHColor = color(0, 127);
color HVCColor = color(0, 127);
color EColor = color(0, 127);
color MColor = color(0, 127);
color HColor = color(0, 127);
color SColor = color(0, 127);

int sizeGm = 40;
int sizeOptionH = 25;

int sizeOption = 25;
int sizeStart = 40;
BackgroundStart gameMode;
BackgroundStart humanVsHuman;
BackgroundStart humanVsCpu;
BackgroundStart easyMode;
BackgroundStart mediumMode;
BackgroundStart hardMode;
BackgroundStart startGame;

PVector gameModePos;
PVector humanVsHumanPos;
PVector humanVsCpuPos;
PVector easyModePos;
PVector mediumModePos;
PVector hardModePos;
PVector startGamePos;

PVector gmRectPropo;
PVector hhRectPropo;

PVector hardRectPropo;
PVector startRectPropo;





// image de 1er arrière-plan
void firstBackground() {
  img = loadImage("img/fond.png");
  img.resize(800, 600);
  image(img, 0, 0);
  drawBackground();
  buttonClicked();
  
}


//fonction pour choisir le mode du jeu
void buttonClicked() {
  if (mouseX >= 65 && mouseX <= 290 && mouseY >= 150 && mouseY <= 200) {
    HVHColor = color(123, 127);
    if (mousePressed && mouseButton == LEFT) {
      order[0] = "HVH"; 
      son.play();
    }
  } else {
    HVHColor = color(0, 127);
  }


  if (mouseX >= 510 && mouseX <= 735 && mouseY >= 150 && mouseY <= 200) {
    HVCColor = color(123, 127);
    if (mousePressed && mouseButton == LEFT) {
      order[0] = "HVC";
      son.play();
    }
  } else {
    HVCColor = color(0, 127);
  }

  if (mouseX >= 50 && mouseX <= 200 && mouseY >= 300 && mouseY <= 350) {
    EColor = color(123, 127);
    if (mousePressed && mouseButton == LEFT) {
      order[1] = "E";
      son.play();
    }
  } else {
    EColor = color(0, 127);
  }

  if (mouseX >= 325 && mouseX <= 475 && mouseY >= 300 && mouseY <= 350) {
    MColor = color(123, 127);
    if (mousePressed && mouseButton == LEFT) {
      order[1] = "M";
      son.play();
    }
  } else {
    MColor = color(0, 127);
  }

  if (mouseX >= 600 && mouseX <= 750 && mouseY >= 300 && mouseY <= 350) {
    HColor = color(123, 127);
    if (mousePressed && mouseButton == LEFT) {
      order[1] = "H";
      son.play();
    }
  } else {
    HColor = color(0, 127);
  }

  if (mouseX >= 300 && mouseX <= 500 && mouseY >= 450 && mouseY <= 500) {
    SColor = color(123, 127);
    if (mousePressed && mouseButton == LEFT) {
      if(order[0] == null || order[1] == null){ // if the troisieme element n'est pas remplie on n'abouti pas pour qu'on ait pas bug
        
      order[2] = "";}
      else{order[2] = "S";
      startTime = millis();
    son.play();}
        
    }
  } else {
    SColor = color(0, 127);
  }
}


void drawBackground() {
  gameModePos = new PVector (200, 50);
  humanVsHumanPos= new PVector (65, 150);
  humanVsCpuPos= new PVector (510, 150);
  easyModePos= new PVector (50, 300);
  mediumModePos= new PVector (325, 300);
  hardModePos= new PVector (600, 300);
  startGamePos= new PVector (300, 450);

  gmRectPropo= new PVector (400, 50);
  hhRectPropo= new PVector (225, 50);

  hardRectPropo= new PVector (150, 50);
  startRectPropo= new PVector (200, 50);

  gameMode = new BackgroundStart("Game mode", gameModePos, sizeGm, gmRectPropo, MGColor);
  humanVsHuman = new BackgroundStart("Human Vs Human", humanVsHumanPos, sizeOptionH, hhRectPropo, HVHColor);
  humanVsCpu = new BackgroundStart("Human Vs Cpu", humanVsCpuPos, sizeOptionH, hhRectPropo, HVCColor);
  easyMode = new BackgroundStart("Easy", easyModePos, sizeOption, hardRectPropo, EColor);
  mediumMode = new BackgroundStart("Medium", mediumModePos, sizeOption, hardRectPropo, MColor);
  hardMode = new BackgroundStart("Hard", hardModePos, sizeOption, hardRectPropo, HColor);
  startGame = new BackgroundStart("Start", startGamePos, sizeStart, startRectPropo, SColor);
}
