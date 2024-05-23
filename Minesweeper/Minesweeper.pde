//Minesweeper class
public static double percentMines;
private boolean gameStarted;
private double time;
private Field board;

void setup() {
  size(100,100);
  board = new Field(10,10);
}
