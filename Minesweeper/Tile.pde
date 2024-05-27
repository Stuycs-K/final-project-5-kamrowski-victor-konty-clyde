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

public Tile(int r,int c){
hasBeenClicked = false;
neighborCount = -1;
row =r; col=c;
//if(Math.random()<percentMines){
//isMine = true;
//}
//else{
isMine = false;
//}
isMarked = false;
tileSize = 100;
xCoord = c*tileSize;
yCoord = r*tileSize;
}

public void showProperty(){
if(hasBeenClicked){
if(!isMine){
  fill(255);
text("" + neighborCount, xCoord+tileSize/2, yCoord+tileSize/2);
}else{
  fill(255,0,0);
triangle(xCoord,yCoord,xCoord+tileSize/2,yCoord+tileSize,xCoord+tileSize,yCoord);
}

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



public int getTileSize(){
return tileSize;
}

public void clicked(){
hasBeenClicked = true;
showProperty();
}

public void changeMine(){
isMine = !isMine;
}


}
