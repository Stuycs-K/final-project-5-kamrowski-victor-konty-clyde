//Minesweeper class
public static double percentMines;
private boolean gameStarted;
private double time;
private Field board;

void setup() {
  size(1000,1000);
  board = new Field(10,10);
  board.display();
}

void mousePressed(){
double xVal = pmouseX;
double yVal = pmouseY;
int rowS = -1;
int colS = -1;
for(int x = 0;x<board.getWidth();x++){
if(xVal-(board.getTilesSize()*x)<board.getTilesSize()){
colS = x;
continue;
}}
for(int y = 0;y<board.getLength();y++){
if(yVal-(board.getTilesSize()*y)<board.getTilesSize()){
rowS = y;
continue;
}
}
board.getMineField()[rowS][colS].clicked();
}
