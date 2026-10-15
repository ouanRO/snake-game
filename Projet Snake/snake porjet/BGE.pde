FinalBackground finalBackground;
color buttonColor;
String [] orderf = new String[1];
class FinalBackground {


  String winner;
  int player1Score;
  int player2Score;
  int cpuScore;
  PImage finalBackground;
  
  FinalBackground(String winner, int score1, int score2, int cpuScore) {
    player1Score = score1;
    player2Score = score2;

}
  void display() {
    finalBackground = loadImage("img/finalBackground.png");
    finalBackground.resize(800,600);
    image(finalBackground,0,0);
    stroke(0);
    textAlign(CENTER, CENTER);
    textSize(40);
    drawTextWithBold( "the winner is : " + "\n" + whoWon, width / 2, height / 2, 50);
    
    
    if(order[0].equals("HVH")){
    drawTextWithBold("PLAYER 1 : " + "\n" + snake1Length, width * 0.2, 150, 30);
    drawTextWithBold("PLAYER 2 : " + "\n" + snake2Length, width * 0.8, 150, 30);
    }
    if(order[0].equals("HVC")){
    drawTextWithBold("PLAYER 1 : " + "\n" + snake1Length, width * 0.2, 150, 30);
    drawTextWithBold("PLAYER 2 : " + "\n" + cpuLength, width * 0.8, 150, 30);
    }
    
    if (cpuScore > 0) {
      drawTextWithBold("CPU: " + cpuScore, width / 2, height / 2 + 100, 30);
    }
    drawButton();
  }
  void drawButton() {

   
    fill(123, 127);
    rect(280, 25, 220, 60, 20);
    drawTextWithBold("SCORE ", width / 2, 50, 50);
  }
  void drawTextWithBold(String text, float x, float y, float fontSize) {
    float boldOffset = 2;

    fill(0);
    textSize(fontSize);
    text(text, x, y);

    fill(255);
    textSize(fontSize);
    text(text, x + boldOffset, y + boldOffset);
  }
}




  
