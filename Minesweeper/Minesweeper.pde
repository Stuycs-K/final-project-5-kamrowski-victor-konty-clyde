//Minesweeper class
public static double percentMines;
private boolean gameStarted;
private boolean modeSelected;
private double time;
private Field board;
private int totalBombs;
private int markedBombs;
private int clickedTiles;


void setup() {
  size(1000,770);
  time = 0; totalBombs = 0; markedBombs = 0; clickedTiles = 0;
  gameStarted = false; modeSelected = false;
}

void draw(){
  if (!modeSelected){
    background(255);
    fill(0,0,255);
    textSize(40);    
    text("for easy mode, press 1", 100,100);
    text("for medium mode, press 2", 100,250);
    text("for hard mode, press 3", 100,400);
    return;
  }
background(255);
board.display();
timer();
if(gameStarted){
fill(2,2,200);textSize(40);
int bombHolder = totalBombs-markedBombs;
  text("Bombs left: " + bombHolder + "/" + totalBombs, 235, 35);
}
if(board.getHeight()*board.getWidth()-totalBombs<=clickedTiles){
board.win();
}
}

void mousePressed(){
  if (! modeSelected) {
   return; 
  }
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
if (mouseButton == LEFT && rowS!=-1&&colS!=-1) {

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
  if (! modeSelected) {
   if (key == '1') initialize(1); 
   if (key == '2') initialize(2); 
   if (key == '3') initialize(3); 
  }
 
  if (key == 'r' || key == 'R') {
  this.setup(); 
 }
}

public void initialize(int difficulty) {
  if (difficulty == 1) {
    board = new Field(9,9,(height-70)/9);
    board.display();
    percentMines = .16;
  }
  if (difficulty == 2) {
    board = new Field(16,16,(height-70)/16);
    board.display();
    percentMines = .17;
  }
  if (difficulty == 3) {
    board = new Field(30,16,30);
    board.display();
    percentMines = .20;
  }
  for(int y = 0;y<board.getHeight();y++){
  for(int x = 0;x<board.getWidth();x++){
  if (Math.random()<percentMines){
  board.getMineField()[y][x].changeMine();
  }
  }
  }
  fill(2,2,200);textSize(40);
  text("Time: " + time, 35, 35);
  modeSelected = true;
}



public void timer(){
  fill(2,2,200);textSize(40);
  text(String.format("Time: %.1f", time), 35, 35);
if(gameStarted && !board.getLost() && !board.getWin()){
time = time +(1.0/57.25);
}
else if(board.getLost() || board.getWin()){
return;
}
}
