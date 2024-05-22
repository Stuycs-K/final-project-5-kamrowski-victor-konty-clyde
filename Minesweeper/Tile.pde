//Tile class
private boolean hasBeenClicked;
private int neighborCount;
private boolean isMine;
private boolean isMarked;

public Tile(){
hasBeenClicked = false;
neighborCount = -1;
if(Math.random()<percentMines){
isMine = true;
}
else{
isMine = false;
}
isMarked = false;
}
