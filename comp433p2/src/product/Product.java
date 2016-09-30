package product;

public class Product {
	int productID;

}


package board;


import constant.Constant;
import player.Player;
import util.ScreenUtil;

/**
 * This class is the game board itself
 * @author Owner
 *
 */

public class GameBoard {

	private char[][] cells;
	private int numRows;
	private int numColumns;
	private int messageFlag; //data members for primitive int defaults to 0
	private int maxCount;
	private int threshold;
	private int filledCells; //data members for primitive int defaults to 0

	/**
	 * Default Game board
	 */
	public GameBoard() {
		numColumns = Constant.SMALL_X;
		numRows = Constant.SMALL_Y;
		cells = new char[Constant.SMALL_X][Constant.SMALL_Y];
		// initialize the empty board's cell
		populateBoard(Constant.EMPTY_CELL);
	}

	public void populateBoard(char emptyCell) {
		for(int i = 0; i < getNumColumns(); i++) {
			for(int j = 0; j < getNumRows(); j++) {
				cells[j][i] = emptyCell;
			}
		}	
	}

	/**
	 * 
	 * @param numRows custom board height
	 * @param numColumns custom board width
	 */
	public GameBoard(int numRows, int numColumns) {
		this.numRows = numRows;
		this.numColumns = numColumns;
		maxCount = numRows*numColumns;
		threshold = (int)(0.75 * maxCount);
		cells = new char[numRows][numColumns];
		// initialize the empty board's cell
		populateBoard(Constant.EMPTY_CELL);
	}

	public boolean isFull() {
		for(int i = 0; i < getNumRows(); i++) {
			for(int j=0; j < getNumColumns(); j++ )
				if (cells[i][j] == ' ') {
					return false;
				}
		}
		return true;
	}

	/**
	 * This method places the chip, first checking the input row and column have been converted to valid array indices
	 * @param s the current player
	 * @param row the displayed row
	 * @param column the displayed column
	 * @return whether the move was placed
	 */
	public boolean placeChip(Player s,int row, int column) {
		boolean placed = false;
		//covert the selected numbers from row labels to array indices
		int adjRow = convertFromDisplay(row);
		int adjCol = convertFromDisplay(column);
		if (isValidMove(adjRow, adjCol)) {
			//place the symbol in the cell
			cells[adjRow][adjCol] = s.getChipSymbol();
			//increment filled Cells
			filledCells++;
			//check if board is 75% filled
			if(filledCells >= threshold && messageFlag == 0){
				ScreenUtil.display("Board is 75% filled! hurry up!");
				messageFlag = 1; 
			}
			//check for winner
			if (hasWinner(adjRow, adjCol)) {
				s.declareWinner();
			}
			placed = true;
		} else {
			placed = false;
			ScreenUtil.display("Sorry, that place is taken.");
		}
		return placed;
	}

	/**
	 * This method checks that the cell is empty, and row/column as between 0, inclusive, and the total size of the number of rows. exclusive
	 * @param row the adjusted row
	 * @param column the adjusted column
	 * @return whether the move is valid
	 */
	public boolean isValidMove(int row, int column) {
		// check empty cells last to avoid array out of bounds exception by utilizing short-circuiting
		return (row >= 0 && row < getNumRows()) && (column >= 0 && column < getNumColumns()) && (cells[row][column] == Constant.EMPTY_CELL);
	}

	/**
	 * This method checks for the win number in each direction
	 * @param selectedRow the user selected row
	 * @param selectedColumn the user selected column
	 * @return whether there is a winner
	 */
	public boolean hasWinner(int selectedRow, int selectedColumn) {
		return checkRow(selectedRow, selectedColumn) || checkColumn(selectedRow, selectedColumn) || checkDiagonalAsc(selectedRow, selectedColumn) || checkDiagonalDes(selectedRow, selectedColumn);
	}

	/**
	 * This method checks if there is a win diagonally from right top to left bottom
	 * @param selectedRow
	 * @param selectedColumn
	 * @return
	 */
	private boolean checkDiagonalAsc(int selectedRow, int selectedColumn) {
		//search both top and bottom sides if one side doesn't have a Five in a row
		boolean isMatch = false;
		//assign the current player symbol
		char currentPlayer = cells[selectedRow][selectedColumn];
		// total count diagonally parallel to y = x
		int count = 0;
		//left bottom
		// assume that width is always >= rows
		//int j = 0;
		//int i = 0;
		int adjRow = selectedRow ;
		int adjCol = selectedColumn;
		
		for(int i=0; i<=selectedRow; i++){
			for(int j=0; j<=selectedColumn; j++){
				
				while (adjRow >= 0  && adjCol < getNumColumns() && adjCol >=0 && adjRow < getNumRows()) {
				char cell = cells[adjRow][adjCol];
				// restrict index to the number of columns. do not assume that board is a square
				if (currentPlayer == cells[adjRow][adjCol]){
					count++;
					if(Constant.WIN_SIZE == count) {
						isMatch = true;
						break;
					}
				} else {
					break;
				}
				//increment
				i++;
				j++;
				adjRow = selectedRow + i;
				adjCol = selectedColumn - j;
			}}
		}
		
		//right top
		adjRow = selectedRow ;
		adjCol = selectedColumn ;
		
		for(int i=0; i<getNumRows()-selectedRow; i++){
			for(int j=0; j<getNumColumns()-selectedColumn; j++){
				
		
		while (adjRow >= 0  && adjCol < getNumColumns() && adjCol >=0 && adjRow < getNumRows()) {
			if (currentPlayer == cells[adjRow][adjCol]){
				count++;
				// off by 1 due to double-counting original stone
				if (Constant.WIN_SIZE == (count - 1)) {
					isMatch = true;
					break;
				}
			} else {
				break;
			}
			//increment
			i++;
			j++;
			adjRow = selectedRow - i;
			adjCol = selectedColumn + j;
		} 
			}
			}
		return isMatch;
	}

	private boolean checkDiagonalDes(int selectedRow, int selectedColumn) {
		//search both top and bottom sides if one side doesn't have a Five in a row
		boolean isMatch = false;
		//assign the current player symbol
		char currentPlayer = cells[selectedRow][selectedColumn];
		//total count diagonally parallel to y = -x
		int count = 0;
		//left top
		//int j = 0;
		//int i = 0;
		int adjRow = selectedRow ;
		int adjCol = selectedColumn ;
		
		for(int i=0; i<=selectedRow; i++){
			for(int j=0; j<=selectedColumn; j++){
				
		while (adjRow >= 0  && adjCol < getNumColumns() && adjCol >=0 && adjRow < getNumRows()) {
			if (currentPlayer == cells[adjRow][adjCol]){
				count++;
				if (Constant.WIN_SIZE == count){
					isMatch = true;
					break;
				}
			} else {
				break;
			}
			//increment
			i++;
			j++;
			adjRow = selectedRow - i;
			adjCol = selectedColumn - j;
		
		}
			}
			}
		//right bottom
		// this does consider if the board size is rectangular. i.e. board width can actually be larger than height
		// create a second index just for number of rows to prevent row out of bounds exception
		adjRow = selectedRow ;
		adjCol = selectedColumn ;
		
		for(int i=0; i<getNumRows()-selectedRow; i++){
			for(int j=0; j<getNumColumns()-selectedColumn; j++){
				
		while (adjRow >= 0  && adjCol < getNumColumns() && adjCol >=0 && adjRow < getNumRows()) {
			if (currentPlayer == cells[adjRow][adjCol]){
				count++;
				// off by 1 due to double-counting original stone
				if (Constant.WIN_SIZE == (count - 1)) {
					isMatch = true;
					break;
				}
			} else {
				break;
			}
			//increment
			i++;
			j++;
			adjRow = selectedRow + i;
			adjCol = selectedColumn + j;
		}
		
			}
			}
		return isMatch;
	}
	
	private boolean checkColumn(int selectedRow, int selectedColumn) {
		//search both top and bottom sides if one side doesn't have a Five in a row
		boolean isMatch = false;
		//assign the current player symbol
		char currentPlayer = cells[selectedRow][selectedColumn];
		// vertical match count kept here
		int count = 0;
		//top
		for(int i = 0; i <= selectedRow; i++){
			if (currentPlayer == cells[selectedRow - i][selectedColumn]){
				count++;
				if(Constant.WIN_SIZE == count){
					isMatch = true;
					break;
				}
			} else {
				break;
			}
		}
		//bottom
		for(int j = 0; j < (getNumRows() - selectedRow); j++ ){
			if (currentPlayer == cells[selectedRow + j][selectedColumn]){
				count++;
				//the original stone is calculated twice, so subtract 1
				int adjCount = count - 1;
				if(Constant.WIN_SIZE == adjCount) {
					isMatch = true;
					break;
				}
			} else {
				break;
			}
		}
		return isMatch;
	}

	
	/**
	 * 	This method searches both left and right sides if one side doesn't have a "Five in a row"	
	 * @param selectedRow
	 * @param selectedColumn
	 * @return
	 */
	private boolean checkRow(int selectedRow, int selectedColumn) {
		boolean isMatch = false;
		//assign the current player symbol
		char currentPlayer = cells[selectedRow][selectedColumn];
		//count variable for left/right horizontal 5 in a row
		int count = 0;
		//left
		// loop through all of the columns
		for(int i = 0; i <= selectedColumn; i++){
			// increment count if values match on the input row
			if (currentPlayer == cells[selectedRow][selectedColumn - i]){
				count++;
				if(count == Constant.WIN_SIZE) {
					isMatch = true;
					break;
				}
			} else {6666666666
				break;
			}
		}
		//right
		for(int j = 0; j < (getNumColumns() - selectedColumn); j++ ){
			if (currentPlayer == cells[selectedRow][selectedColumn + j]){
				count++;
		        //the original stone is calculated twice, so start from index 1
				if(count - 1 == Constant.WIN_SIZE) {
					isMatch = true;
					break;
				}
			} else {
				break;
			}
		}
		return isMatch;
	}

	@Override
	public String toString() {
		StringBuffer output = new StringBuffer();
		// header
		for(int i = 0; i < getNumColumns(); i++) {
			output.append(Constant.DOUBLE_UNDERSCORE);
		}
		output.append(Constant.LINE_BREAK);
		// board rows are defined as < columns
		for(int i = 0; i < getNumRows(); i++) {
			for(int j = 0; j < getNumColumns(); j++) {
				output.append(cells[i][j] + Constant.SPACE);
			}
			// add row label
			int k = i + 1;
			output.append(Constant.SPACE + k); 
			output.append(Constant.LINE_BREAK);
		}
		// footer
		for(int i = 0; i < getNumColumns(); i++) {
			output.append(Constant.DOUBLE_UNDERSCORE);
		}
		output.append(Constant.LINE_BREAK);
		for(int i = 0; i < getNumColumns(); i++) {
			output.append(i + 1 + Constant.SPACE); //start numbering at 1, not 0
		}
		return output.toString();
	}

	public int getNumRows() {
		return numRows;
	}

	public int getNumColumns() {
		return numColumns;
	}
	
	/**
	 * This method converts from screen board label to array indices
	 * @param boardLabel the displayed row or column number 
	 * @return the array index
	 */
	public static int convertFromDisplay(int boardLabel) {
		return boardLabel - 1;
	}


