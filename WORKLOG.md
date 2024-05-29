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

### May 26th 2024

At home:
- Created draw method to make display method work
- Edited showProperty method to put numbers/flags in the middle of the tile (and changed colors)
- Fixed mousePressed method, (after implementing draw method: when a tile was clicked, it would either show int countNeighbors, or a red triangle representing a bomb)
- Added on to setup to use percentMines instance variable and give a certain amount of tiles the isMine property true depending on the value of percentMines
- Created changeMine method in Tile class to turn any tile into having instance variable mine true


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
