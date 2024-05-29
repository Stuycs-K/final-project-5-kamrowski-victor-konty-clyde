//Tile class
public class Tile{
private boolean hasBeenClicked;
private int neighborCount;
private boolean isMine;
private boolean isMarked;
private int row,col;
private int xCoord;
private int yCoord;
private int tileSize;
private boolean hasBeenFlagged;

public Tile(int r,int c){
hasBeenClicked = false; hasBeenFlagged = false;
neighborCount = -1;
row =r; col=c;
//if(Math.random()<percentMines){
//isMine = true;
//}
//else{
isMine = false;
//}
isMarked = false;
tileSize = 40;
xCoord = c*tileSize;
yCoord = r*tileSize+70;
}

public void showProperty(){
if(hasBeenClicked){
if(!isMine){
  if (neighborCount != 0) {
  fill(255); textSize(0.5*tileSize);
text("" + neighborCount, xCoord+tileSize/2, yCoord+tileSize/2);
  }else{
    fill(255);
  square(xCoord,yCoord,tileSize);
  }
if (neighborCount == 0) this.fillIn();
}else{
  fill(255,0,0);
triangle(xCoord,yCoord,xCoord+tileSize/2,yCoord+tileSize,xCoord+tileSize,yCoord);
board.loss();
}

}
if (hasBeenFlagged) {
  fill(0,0,255);
triangle(xCoord,yCoord,xCoord+tileSize/2,yCoord+tileSize,xCoord+tileSize,yCoord);
}
}

public void markOrUnmark(){
isMarked = !isMarked;
if(isMarked){
  fill(255,0,0);
triangle(xCoord-1,yCoord,xCoord,yCoord+1,xCoord,yCoord-1);
}else{
fill(153);
rect(xCoord,yCoord,0.5%tileSize,0.5*tileSize);
}
}

public void display() {
  fill(153); 
 square(xCoord,yCoord,tileSize);
 showProperty();
}

public void setNeighbors(){
  if (isMine) return;
  int ans = 0;
  for(int r = row-1; r<row+2; r++){
    for (int c=col-1; c<col+2; c++){
      if (r >= 0 && r < board.getHeight() && c>=0 && c < board.getWidth() && board.getMineField()[r][c].isMine == true){
        ans ++;
      }
    }}
   neighborCount = ans; 
   
}


public void fillIn(){
  for(int r = row-1; r<row+2; r++){
    for (int c=col-1; c<col+2; c++){
      if (r >= 0 && r < board.getHeight() && c>=0 && c < board.getWidth() && !(r==row && c==col)){
        if (!board.getMineField()[r][c].hasBeenClicked()) board.getMineField()[r][c].clicked();
      }}
    } 
}

public int getTileSize(){
return tileSize;
}

public void clicked(){
  if(!hasBeenClicked){
  clickedTiles++;
  }
  if (hasBeenFlagged) {
   hasBeenFlagged = false;
   markedBombs--;
   fill(255);
triangle(xCoord,yCoord,xCoord+tileSize/2,yCoord+tileSize,xCoord+tileSize,yCoord);
return;
  }
hasBeenClicked = true;
showProperty();
}

public void changeMine(){
isMine = !isMine;
}

public boolean isMine(){
 return isMine; 
}

public void makeNotMine(){
isMine = false;
}

public boolean hasBeenClicked(){
 return hasBeenClicked; 
}

public void make0(){
isMine = false;
for(int r = row-1; r<row+2; r++){
    for (int c=col-1; c<col+2; c++){
      if (r >= 0 && r < board.getHeight() && c>=0 && c < board.getWidth()){
        board.getMineField()[r][c].makeNotMine();
      }
    }}
}

public void placeFlag(){
  if(!hasBeenFlagged){
  markedBombs++;
  }
hasBeenFlagged = true;
}

}
