
ArrayList<PVector> cpu = new ArrayList<PVector>(); // initialisation de cpu
PVector cpuPos; // sa position
PVector cpuDirection = new PVector (0, 0); //direction
int cpuSpeed = 1; //vitesse
int cpuLength = 0; // et longueur

class Cpu {
  PVector cpuPos;
  PVector cpuDirection;
  int cpuSpeed;
  int cpuLength;

  Cpu(ArrayList <PVector> cpu, PVector cpuPos, int sizeCel, PVector cpuDirection) {
    // gestion de dessin de serpent en fonction de la direction(forme, couleur, yeux...)
    fill(0, 0, 255);
    noStroke();
    rect(cpuPos.x  *sizeCel, cpuPos.y*sizeCel, sizeCel, sizeCel, 10); // la tete du serpent
    if (cpuDirection.x == -1 ) {
      fill(255); // dessiner les yeux en fonction de la direction
      ellipse((cpuPos.x*sizeCel) +5, cpuPos.y*sizeCel + 5, 5, 5);
      ellipse((cpuPos.x*sizeCel) +5, cpuPos.y*sizeCel + 15, 5, 5);
    } else if (cpuDirection.x == 1 ) {
      fill(255);
      ellipse((cpuPos.x*sizeCel) + 15, cpuPos.y*sizeCel + 5, 5, 5);
      ellipse((cpuPos.x*sizeCel) + 15, cpuPos.y*sizeCel + 15, 5, 5);
    } else if (cpuDirection.y == 1 ) {
      fill(255);
      ellipse((cpuPos.x*sizeCel) + 5, cpuPos.y*sizeCel + 15, 5, 5);
      ellipse((cpuPos.x*sizeCel) + 15, cpuPos.y*sizeCel + 15, 5, 5);
    } else if (cpuDirection.y == -1 ) {
      fill(255);
      ellipse((cpuPos.x*sizeCel) + 5, cpuPos.y*sizeCel + 5, 5, 5);
      ellipse((cpuPos.x*sizeCel) + 15, cpuPos.y*sizeCel + 5, 5, 5);
    }
    for (int i = 0; i < cpu.size(); i++) {
      fill(0, 0, 255);
      noStroke();
      rect(cpu.get(i).x * sizeCel, cpu.get(i).y*sizeCel, sizeCel, sizeCel);
    }
  }
  // fonction pour actualiser la position de cpu
  void update(ArrayList <PVector> cpu, int cpuSpeed, PVector cpuDirection, int cpuLength, PVector cpuPos) {
    if (frameCount % cpuSpeed == 0) { // dessiner les carrés du serpent en fontion du temps 
      cpu.add(new PVector(cpuPos.x, cpuPos.y)); // ajouter les coordonnées du serpent
      while (cpu.size() > cpuLength) { // dessiner les carrées du serpent en fonction de la longueur du serpent
        cpu.remove(0); // supprimer le dernier carré car nous l'avons dessiné
      }
      cpuPos.add(cpuDirection);// actualiser la direction 
    }
  }
}
