//Minesweeper class
public static double percentMines;
private boolean gameStarted;
private double time;
private Field board;

void setup() {
  size(1000,1000);
  board = new Field(10,10);
  board.display();
}
