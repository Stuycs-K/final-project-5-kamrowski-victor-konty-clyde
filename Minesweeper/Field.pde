//Field class
public class Field{
private Tile[][] mineField;
private int fieldWidth;
private int fieldHeight;
private int tilesSize;
private boolean lost, won;

public Field(int widthF, int heightF, int tilesize){
  fieldWidth = widthF;
  fieldHeight = heightF;
  lost = false; won = false;
mineField = new Tile[fieldHeight][fieldWidth];
for (int x = 0;x<heightF;x++){
for(int y = 0;y<widthF;y++){
mineField[x][y] = new Tile(x,y,tilesize);
}
}
tilesSize = tilesize;
}


public void display() {
  for (int col = 0; col < mineField[0].length; col++) {
    for (int row = 0; row < mineField.length; row++) {
      mineField[row][col].display();
    }
  }
  if (lost) {
    for (int col = 0; col < mineField[0].length; col++) {
    for (int row = 0; row < mineField.length; row++) {
      if(mineField[row][col].isMine()){
      mineField[row][col].clicked();
    }}
  }
    fill(200,0,0);
  //square(height/3,width/3,350);
textSize(70);
fill(0,200,0);
text("You Lost!",height/2.5,width/2.5);
textSize(30);
if(diff == 1){
text("Best time for easy: " + besttime1,height/2.5,width/2.5 + 150);
  }else if(diff == 2){
  text("Best time for medium: " + besttime2,height/2.5,width/2.5 + 150);
  }
else{
text("Best time for hard: " + besttime3,height/2.5,width/2.5 + 150);
}}
  if(won){
  fill(0,0,200);
  //square(height/3,width/3,350);
  textSize(70);
fill(0,200,0);
text("You Won!",height/2.5,width/2.5);
textSize(30);
if(diff == 1){
text("Best time for easy: " + besttime1,height/2.5,width/2.5 + 150);
  }else if(diff == 2){
  text("Best time for medium: " + besttime2,height/2.5,width/2.5 + 150);
  }
else{
text("Best time for hard: " + besttime3,height/2.5,width/2.5 + 150);
}
  }
}


public int getWidth() {
 return fieldWidth; 
}

public int getHeight() {
 return fieldHeight; 
}


public int getTilesSize(){
return tilesSize;
}

public Tile[][] getMineField(){
return mineField;
}

public void loss() {
 lost =true; 
}
public boolean getLost(){
 return lost; 
}

public boolean getWin(){
return won;
}
public void win() {
 won = true; 
}

}
