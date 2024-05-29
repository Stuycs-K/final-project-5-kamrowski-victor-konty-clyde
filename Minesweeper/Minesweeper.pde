//Minesweeper class
public static double percentMines;
private boolean gameStarted;
private double time;
private Field board;
private int totalBombs;
private int markedBombs;


void setup() {
  size(1050,1150);
  board = new Field(15,15);
  time = 0; totalBombs = 0; markedBombs = 0;
  gameStarted = false;
  board.display();
  percentMines = .20;
  for(int y = 0;y<board.getHeight();y++){
  for(int x = 0;x<board.getWidth();x++){
  if (Math.random()<percentMines){
  board.getMineField()[y][x].changeMine();
  }
  }
  }
  fill(2,2,200);textSize(40);
  text("Time: " + time, 35, 35);
}

void draw(){
background(255);
board.display();
timer();
if(gameStarted){
fill(2,2,200);textSize(40);
int bombHolder = totalBombs-markedBombs;
  text("Bombs left: " + bombHolder + "/" + totalBombs, 335, 35);
}
}

void mousePressed(){
  if (board.getLost()){
    return; 
  }
double xVal = mouseX;
double yVal = mouseY;
int rowS = -1;
int colS = -1;
for(int x = 0;x<board.getWidth();x++){
if(xVal>=x*board.getTilesSize() && xVal<=(x+1)*board.getTilesSize()){
colS = x;
break;
}}
for(int y = 0;y<board.getHeight();y++){
if(yVal>=(y)*board.getTilesSize()+70 && yVal<=(y+1)*board.getTilesSize()+70){
rowS = y;
break;
}
}
if (mouseButton == LEFT) {

  if(!gameStarted && rowS>=0){
  board.getMineField()[rowS][colS].make0();
  for(int y = 0;y<board.getHeight();y++){
  for(int x = 0;x<board.getWidth();x++){
    board.getMineField()[y][x].setNeighbors();
    if(board.getMineField()[y][x].isMine()){
    totalBombs++;
    }
  }}
  gameStarted = true;
  board.getMineField()[rowS][colS].clicked();
  }
else if(rowS != -1 && colS != -1){
board.getMineField()[rowS][colS].clicked();
}
}
else if(mouseButton == RIGHT) {
  if(! board.getMineField()[rowS][colS].hasBeenClicked()) {
    board.getMineField()[rowS][colS].placeFlag();
  }
}
}

public void keyPressed(){
 if (key == 'r' || key == 'R') {
  this.setup(); 
 }
}


public void timer(){
  fill(2,2,200);textSize(40);
  text(String.format("Time: %.1f", time), 35, 35);
if(gameStarted && !board.getLost()){
time = time +(1.0/57.25);
}
else if(board.getLost()){
return;
}
}
