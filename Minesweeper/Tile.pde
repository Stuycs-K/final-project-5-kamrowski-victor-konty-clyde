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
hasBeenClicked = true;
neighborCount = -1;
row =r; col=c;
//if(Math.random()<percentMines){
//isMine = true;
//}
//else{
isMine = false;
//}
isMarked = false;
xCoord = c*100;
yCoord = r*100;
tileSize = 100;
}

public void showProperty(){
if(hasBeenClicked){
if(!isMine){
text("" + neighborCount, xCoord+3, yCoord+3);
}else{
  fill(255,255,255);
triangle(xCoord-10,yCoord,xCoord,yCoord+10,xCoord,yCoord-10);
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
rect(xCoord,yCoord,
}
}

public void display() {
 square(xCoord,yCoord,tileSize);
 showProperty();
}

}
