//Field class
public class Field{
private Tile[][] mineField;
private int fieldWidth;
private int fieldHeight;
private int tilesSize;

public Field(int widthF, int heightF){
  fieldWidth = widthF;
  fieldHeight = heightF;
mineField = new Tile[fieldHeight][fieldWidth];
for (int x = 0;x<heightF;x++){
for(int y = 0;y<widthF;y++){
mineField[x][y] = new Tile(x,y);
}
}
tilesSize = mineField[0][0].getTileSize();
}


public void display() {
  for (int col = 0; col < mineField[0].length; col++) {
    for (int row = 0; row < mineField.length; row++) {
      mineField[row][col].display();
    }
  }
}

public int getWidth() {
 return fieldWidth; 
}

public int getLength() {
 return fieldHeight; 
}


public int getTilesSize(){
return tilesSize;
}

public Tile[][] getMineField(){
return mineField;
}

}
