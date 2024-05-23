//Tile class
public class Tile{
private boolean hasBeenClicked;
private int neighborCount;
private boolean isMine;
private boolean isMarked;
private int xCoord;
private int yCoord;

public Tile(){
hasBeenClicked = false;
neighborCount = -1;
//if(Math.random()<percentMines){
//isMine = true;
//}
//else{
isMine = false;
//}
isMarked = false;
}

public void showProperty(){
if(hasBeenClicked){
if(!isMine){
text("" + neighborCount, xCoord, yCoord);
}else{
triangle(xCoord-1,yCoord,xCoord,yCoord+1,xCoord,yCoord-1);
}

}
}

}
