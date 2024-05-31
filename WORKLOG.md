# Work Log

## Victor Kamrowski

### May 22nd 2024

In class:
- Created Minesweeper, Field, and Tile classes
- Created Field and Tile constructors
- Created Minesweeper, Field, and Tile instance variables

At home:
- Added xCoord and yCoord instance variables to Tile class
- Added showProperty method which needs Minesweeper class made to test

### May 23rd 2024

In class:
- Figured out working with all the branches in class with clyde
- Partially created markOrUnmark method in Tile, and added more neccessary instance variables

### May 24th 2024

In class:
- Added tilesSize instance variable to Field class
- Added getTilesSize and getMineField methods in Field class
- Almost completed mousePressed method in Minesweeper main
- Added getTileSize and clicked methods in Tile class, made a few small edits to fix tile design

### May 27th 2024

At home:
- Created draw method to make display method work
- Edited showProperty method to put numbers/flags in the middle of the tile (and changed colors)
- Fixed mousePressed method, (after implementing draw method: when a tile was clicked, it would either show int countNeighbors, or a red triangle representing a bomb)
- Added on to setup to use percentMines instance variable and give a certain amount of tiles the isMine property true depending on the value of percentMines
- Created changeMine method in Tile class to turn any tile into having instance variable mine true

### May 28th 2024

In class:
- Added more to mousePressed method to always make first click on a tile with 0 mine neighbors
- Made makeNotMine method and make0 method in Tile class for mousePressed method

At home (May 29th 2024 but done before school):
- Created top border to show time and mines remaining
- Created timer method in Minesweeper main to calculate time
- Made slight edits to draw and addedd a few instance variables to deal with time and mines remaining

### May 29th 2024

In class:
- Added win condition and made slight edits to lose condition
- Added getWin method in Field class
- Slight edits to draw, mousePressed, setup, and added another instance variable
- Slight edits in tile for scaling tiles

At home (May 30th 2024 but done before school):
- Slight edits to setup, draw, mousePressed, intiialize, and timer
- Added colors to tile numbers that represent neighborss with mines (same colors as original game)

## Clyde Konty

### May 23rd 2024

In class:
- Created display in tile class
- Started setup in minesweeper class
- Created display, getwidth, and getlength in field class

At home:
- Tweaked setup
- Fixed Tile constructor

### May 27th 2024 

At Home: 
- added countNeighbors method
- added lose condition

### May 28th 2024

In Class:
- added fillIn method for when tile clicked has no mine neighbors
- fixed accociated bugs

At Home:
- created flagging
- fixed bugs accociated with lose condition
- changed tile sizing

### May 29th 2024

In Class:
- added keypressed, for reset board
- added different dimensions

At Home:
- added difficulty selectors

### May 30th 2024

In Class
- Worked on importing images for mineField

At Home
- worked on importing images for homeScreen
- worked on fontType for homeScreen

### May 31st 2024

In Class
- Fixed Timer
- Started to work on making the # of bombs constant
