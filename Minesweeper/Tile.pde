//Tile class
public class Tile{
private boolean hasBeenClicked;
private int neighborCount;
private boolean isMine;
private boolean isMarked;
private int xCoord;
private int yCoord;
private int tileSize;

public Tile(){
hasBeenClicked = true;
neighborCount = -1;
//if(Math.random()<percentMines){
//isMine = true;
//}
//else{
isMine = false;
//}
isMarked = false;
xCoord = 100;
yCoord = 100;
tileSize = 10;
}

public void showProperty(){
if(hasBeenClicked){
if(!isMine){
text("" + neighborCount, xCoord, yCoord);
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


}
