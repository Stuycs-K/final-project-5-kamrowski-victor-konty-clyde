//Field class
public class Field{
private Tile[][] mineField;
private int fieldWidth;
private int fieldHeight;

public Field(int widthF, int heightF){
  fieldWidth = widthF;
  fieldHeight = heightF;
mineField = new Tile[fieldHeight][fieldWidth];
for (int x = 0;x<heightF;x++){
for(int y = 0;y<widthF;y++){
mineField[x][y] = new Tile();
}
}
}

}
