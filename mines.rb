# Create a 2 dimensional array with nine rows and nine columns
MINE_COUNT = 10
MINEFIELD_HEIGHT = 9
MINEFIELD_WIDTH = 9

def generateBoard() 

  board = Array.new(MINEFIELD_HEIGHT) { Array.new(MINEFIELD_WIDTH) }

  mines_left = MINE_COUNT

  while(mines_left > 0) do
    r = rand(9)
    c = rand(9)
  
    if (board[c][r] == nil ) 
      board[c][r] = "m" 
      mines_left -= 1
    end
  end

  return board

end


def getNumNeighbor(board, row, col)
  count = 0
  # return total number of mines adjacent to square[i][j]
  case
  # Middle of the board
  when row > 0 && row < 8 && col > 0 && col < 8
    count += 1 if board[row - 1][col] == 'm'  # ^
    count += 1 if board[row - 1][col + 1] == 'm' # ^>
    count += 1 if board[row][col + 1] == 'm' # >
    count += 1 if board[row + 1][col + 1] == 'm' # v>
    count += 1 if board[row + 1][col] == 'm' # v
    count += 1 if board[row + 1][col - 1] == 'm' # <v
    count += 1 if board[row][col - 1] == 'm' # <
    count += 1 if board[row - 1][col - 1] == 'm' # <^
  # Top left corner
  when row == 0 && col == 0
    count += 1 if board[row][col + 1] == 'm' # >
    count += 1 if board[row + 1][col + 1] == 'm' # v>
    count += 1 if board[row + 1][col] == 'm' # v
  # Top right corner 
  when row == 0 && col == 8
    count += 1 if board[row + 1][col] == 'm' # v
    count += 1 if board[row + 1][col - 1] == 'm' # <v
    count += 1 if board[row][col - 1] == 'm' # <
  # Bottom left corner
  when row == 8 && col == 0
    count += 1 if board[row - 1][col] == 'm'  # ^
    count += 1 if board[row - 1][col + 1] == 'm' # ^>
    count += 1 if board[row][col + 1] == 'm' # >
  # Bottom right corner
  when row == 8 && col == 8
    count += 1 if board[row][col - 1] == 'm' # <
    count += 1 if board[row - 1][col - 1] == 'm' # <^
    count += 1 if board[row - 1][col] == 'm'  # ^
  # Topmost row sans corners
  when row == 0 && col > 0 && col < 8
    count += 1 if board[row][col + 1] == 'm' # >
    count += 1 if board[row + 1][col + 1] == 'm' # v>
    count += 1 if board[row + 1][col] == 'm' # v
    count += 1 if board[row + 1][col - 1] == 'm' # <v
    count += 1 if board[row][col - 1] == 'm' # <
  # Rightmost column sans corners
  when col == 8 && row > 0 && row < 8
    count += 1 if board[row + 1][col] == 'm' # v
    count += 1 if board[row + 1][col - 1] == 'm' # <v
    count += 1 if board[row][col - 1] == 'm' # <
    count += 1 if board[row - 1][col - 1] == 'm' # <^
    count += 1 if board[row - 1][col] == 'm'  # ^
  # Bottom row sans corners
  when row == 8 && col > 0 && col < 8
    count += 1 if board[row][col - 1] == 'm' # <
    count += 1 if board[row - 1][col - 1] == 'm' # <^
    count += 1 if board[row - 1][col] == 'm'  # ^
    count += 1 if board[row - 1][col + 1] == 'm' # ^>
    count += 1 if board[row][col + 1] == 'm' # >
  # Leftmost column sans corners
  when col == 0 && row > 0 && row < 8
    count += 1 if board[row - 1][col] == 'm'  # ^
    count += 1 if board[row - 1][col + 1] == 'm' # ^>
    count += 1 if board[row][col + 1] == 'm' # >
    count += 1 if board[row + 1][col + 1] == 'm' # v>
    count += 1 if board[row + 1][col] == 'm' # v
  end
  return count
end

def getAdjacentMineCount(board)
  countBoard = Array.new(MINEFIELD_HEIGHT) { Array.new(MINEFIELD_WIDTH) }
  for row in 0..8
    for col in 0..8
      # puts "#{row}, #{col}"
      countBoard[row][col] = getNumNeighbor(board, row, col)
    end
  end
  return countBoard
end
      


def displayBoard(board) 
  board.each { |row| row.each { 
    |col| if col == 'm'
  print ' m' 
    elsif col == nil 
      print ' o'
    else
     print " #{col}" 
  end
  }; print "\n" }
end

def removeCover(node, targetState, replacementState)
  
  # If the state of the node is not equalt to targetState, return.
  #Set the state of node to replacement-state.
  #Perform flood-fill (one step west of node, targetState, replacementState)
  #Perform flood-fill (one step east of node, targetState, replacementState)
  #Perform flood-fill (one step north of node, targetState, replacementState)
  #Perform flood-fill (one step south of node, targetState, replacementState)
  #return
  
  # use flood fill to uncover squares
end
system("clear")
board = generateBoard()
# displayBoard(board)
adjacentMineBoard = getAdjacentMineCount(board)
displayBoard(adjacentMineBoard)
print "\n"
displayBoard(board)
