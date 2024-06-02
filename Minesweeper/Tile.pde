//Tile class
public class Tile{
private boolean hasBeenClicked;
private int neighborCount;
private boolean isMine;
private int row,col;
private int xCoord;
private int yCoord;
private int tileSize;
private boolean hasBeenFlagged;

public Tile(int r,int c, int tilesize){
hasBeenClicked = false; hasBeenFlagged = false;
neighborCount = -1;
row =r; col=c;
//if(Math.random()<percentMines){
//isMine = true;
//}
//else{
isMine = false;
//}
tileSize = tilesize;
xCoord = c*tileSize;
yCoord = r*tileSize+70;
}

public void showProperty(){
if(hasBeenClicked){
if(!isMine){
  if (neighborCount != 0) {
    if(neighborCount==1){
  fill(#1123D8);}
  else if(neighborCount==2){
    fill(#317C23);
  }
  else if(neighborCount==3){
  fill(#FA001D);
  }
  else if(neighborCount==4){
  fill(#18295A);
  }
  else if(neighborCount==5){
  fill(#6F2936);
  }
  else if(neighborCount==6){
  fill(#35837F);
  }
  else if(neighborCount==7){
  fill(#121027);
  }
  else if(neighborCount==8){
  fill(#777681);
  }
  textSize(0.5*tileSize);
text("" + neighborCount, xCoord+tileSize/2, yCoord+tileSize/2);
  }else{
    fill(255);
  image(clickTile,xCoord,yCoord,tileSize,tileSize);
  }
if (neighborCount == 0) this.fillIn();
}else{
  fill(255,0,0);
//triangle(xCoord,yCoord,xCoord+tileSize/2,yCoord+tileSize,xCoord+tileSize,yCoord);
image(mine,xCoord,yCoord,tileSize,tileSize);
board.loss();
}

}
if (hasBeenFlagged) {
  fill(0,0,255);
image(flag,xCoord,yCoord,tileSize,tileSize);
}
}


public void display() {
  fill(153); 
 image(tile,xCoord,yCoord,tileSize,tileSize);
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
  if(!hasBeenClicked && !board.getLost()){
  clickedTiles++;
  }
  if (hasBeenFlagged) {
   hasBeenFlagged = false;
   markedBombs--;
   fill(255);
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
