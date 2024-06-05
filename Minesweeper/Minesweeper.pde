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
private double beginning, end;
private double besttime1;
private double besttime2;
private double besttime3;
public int difficulty;

void setup() {
  size(1000,770);
  time = 0; totalBombs = 0; markedBombs = 0; clickedTiles = 0;
  beginning = 0; end = 0; besttime1 = 9999999999.9; besttime2 = 999999999999.9; besttime3 = 999999999999999.9;
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
    difficulty = 1;
  }
  if (difficulty == 2) {
    board = new Field(16,16,(height-70)/16);
    board.display();
    amountMines = 40;
    difficulty = 2;
  }
  if (difficulty == 3) {
    board = new Field(30,16,30);
    board.display();
    amountMines = 99;
    difficulty = 3;
  }
  fill(2,2,200);textSize(40);
  text("Time: " + time, 35, 35);
  modeSelected = true;
}


public void timer(){
  double timeNow = 1.0*millis(); 
  int seconds,tenSeconds,minutes,tenMinutes,tenthSeconds;
  if (gameStarted&& !board.getWin() && !board.getLost()){
      double timeElapsed = timeNow-beginning;
      tenthSeconds=(int)(timeElapsed/100)%10;
      seconds=(int)(timeElapsed/1000)%10;
      tenSeconds=(int)(timeElapsed/10000)%6;
      minutes=(int)(timeElapsed/60000)%10;
      tenMinutes=(int)(timeElapsed/600000);
  }
  else if(!gameStarted){
      tenthSeconds=0;
      seconds=0;
      tenSeconds=0;
      minutes=0;
      tenMinutes=0;
  }
  else{
      double timeElapsed = end-beginning;
      tenthSeconds=(int)(timeElapsed/100)%10;
      seconds=(int)(timeElapsed/1000)%10;
      tenSeconds=(int)(timeElapsed/10000)%6;
      minutes=(int)(timeElapsed/60000)%10;
      tenMinutes=(int)(timeElapsed/600000)%10;
  }
  if(beginning==0 && gameStarted == true && !board.getWin() && !board.getLost()) {
    beginning = 1.0*millis();
  }
  if(end==0 && (board.getWin() || board.getLost())){
    end = 1.0*millis();
    if(difficulty == 1 && besttime1>(end-beginning)/1000){
    besttime1 = end-beginning;
    }
    else if(difficulty == 2 && besttime2>(end-beginning)/1000){
    besttime2 = end;
    }else if (difficulty == 3  && besttime3>(end-beginning)/1000){
    besttime3 = end;
    }
    
  }
  fill(2,2,200);textSize(40);
  text("Time: "+tenMinutes+minutes+":"+tenSeconds+seconds+"."+tenthSeconds, 35, 35);
}
