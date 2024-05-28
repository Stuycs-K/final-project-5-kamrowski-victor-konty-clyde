//Minesweeper class
public static double percentMines;
private boolean gameStarted;
private double time;
private Field board;


void setup() {
  size(1000,1000);
  board = new Field(10,10);
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
}

void draw(){
background(255);
board.display();
}

void mousePressed(){
double xVal = mouseX;
double yVal = mouseY;
int rowS = -1;
int colS = -1;
for(int x = 0;x<board.getWidth();x++){
if(xVal>x*board.getTilesSize() && xVal<(x+1)*board.getTilesSize()){
colS = x;
break;
}}
for(int y = 0;y<board.getHeight();y++){
if(yVal>y*board.getTilesSize() && yVal<(y+1)*board.getTilesSize()){
rowS = y;
break;
}
}
  if(!gameStarted){
  board.getMineField()[rowS][colS].make0();
  for(int y = 0;y<board.getHeight();y++){
  for(int x = 0;x<board.getWidth();x++){
    board.getMineField()[y][x].setNeighbors();
  }}
  gameStarted = true;
  board.getMineField()[rowS][colS].clicked();
  }
else if(rowS != -1 && colS != -1){
board.getMineField()[rowS][colS].clicked();
}
}
