//Minesweeper class
public static int amountMines;
private boolean gameStarted;
private boolean modeSelected;
private double time;
private Field board;
private int totalBombs;
private int markedBombs;
private int clickedTiles;
private PImage mine, flag,tile, clickTile;
private PFont mineFont;
public static int minesChanged;
private double beginning;
private boolean is4;

void setup() {
  size(1000,770);
  time = 0; totalBombs = 0; markedBombs = 0; clickedTiles = 0; is4 = false;
  beginning = 0;
  gameStarted = false; modeSelected = false;
  mine = loadImage("bomb.png");
  flag = loadImage("flag.jpg");
  tile = loadImage("tile.jpg");
  mineFont = loadFont("Constantia-Bold-48.vlw");
  clickTile = loadImage("revealedtile.png");
  textFont(mineFont);
}

void draw(){
  if (!modeSelected){
    background(170,170,170);
    fill(0,0,255);
    for(int x = 0; x < 980; x+=70){
      for (int y = 0; y < 770; y+=70){
        if (x==0||x==70||x==12*70||x==13*70)
        image(mine,x,y,70,70);
        if (y==0||y==70*1||y==70*9||y==70*10)
        image(mine,x,y,70,70);
      }
    }
        textSize(85); 
    text("MINESWEEPER",170,250);
        textSize(50); fill(15,128,255);
    text("for easy mode, press '1'", 170,375);
    text("for medium mode, press '2'", 170,485);
    text("for hard mode, press '3'", 170,595);
    return;
  }
  if(!is4){
background(255);
board.display();
timer();
if(gameStarted){
fill(2,2,200);textSize(40);
int bombHolder = totalBombs-markedBombs;
  text("Bombs left: " + bombHolder + "/" + totalBombs, 300, 35);
}
if(board.getHeight()*board.getWidth()-amountMines<=clickedTiles){
board.win();
}
}}

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

  if(!gameStarted && rowS>=0 && !board.getMineField()[rowS][colS].isFlagged()){
  board.getMineField()[rowS][colS].make0();
  int z = amountMines;
  while(z>0){
  int forHeight = (int)(Math.random()*board.getHeight());
  int forWidth = (int)(Math.random()*board.getWidth());
  if(!board.getMineField()[forHeight][forWidth].isMine() && !board.getMineField()[forHeight][forWidth].returndoNotMakeMine()){
  board.getMineField()[forHeight][forWidth].changeMine();
  z--;
  }
  }
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
   if(key == '4') initialize(4);
  }
 
  if (key == 'r' || key == 'R') {
  this.setup(); 
 }
}

public void initialize(int difficulty) {
  if (difficulty == 1) {
    board = new Field(9,9,(height-70)/9);
    board.display();
    amountMines = 10;
  }
  if (difficulty == 2) {
    board = new Field(16,16,(height-70)/16);
    board.display();
    amountMines = 40;
  }
  if (difficulty == 3) {
    board = new Field(30,16,30);
    board.display();
    amountMines = 99;
  }
  if(difficulty ==4){
    background(255);
  image(mine,0,100,100,100);
  image(flag,100,100,100,100);
  image(tile,200,100,100,100);
  image(clickTile,300,100,100,100);
  is4 = true;
  fill(#1123D8);
  text("1", 500, 500);
    fill(#317C23);
  text("2", 525, 500);
  fill(#FA001D);
  text("3", 550, 500);
  fill(#18295A);
  text("4", 575, 500);
  fill(#6F2936);
  text("5", 600, 500);
  fill(#35837F);
  text("6", 625, 500);
  fill(#121027);
  text("7", 650, 500);
  fill(#777681);
  text("8", 675, 500);
  }
  fill(2,2,200);textSize(40);
  text("Time: " + time, 35, 35);
  modeSelected = true;
}



public void timer(){
  fill(2,2,200);textSize(40);
  if (gameStarted&& !board.getWin() && !board.getLost()){
    double minutes = 0;
    if ((millis()/1000.0-beginning) >= 30) minutes = (millis()/1000.0-beginning+30)/60-1;      
  text("Time: "+String.format("0%.0f:",minutes)+String.format("%.1f", (millis()/1000.0-beginning)%60), 35, 35);
  }
  else{
    text(String.format("Time: %.1f", beginning), 35, 35);
  }
  if(beginning==0 && gameStarted == true && !board.getWin() && !board.getLost()) {
    beginning = millis()/1000.0;
  }
}
