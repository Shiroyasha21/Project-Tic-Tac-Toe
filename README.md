# Project-Tic-Tac-Toe

Pseudo-code

# Game rules
  # Win conditions
    # Horizontal
      # 1 - 2 - 3
      # 4 - 5 - 6
      # 7 - 8 - 9
    # Vertical
      # 1 - 4 - 7
      # 2 - 5 - 8
      # 3 - 6 - 9
    # Diagonal
      # 1 - 5 - 9
      # 3 - 5 - 7  

  # Draw conditions
    # Both players cannot achieve winning conditions 
    # Both players ran out of moves
#

# Board creation and purpose
  # Make board tiles as corresponding numbers from 1 - 9
    # Change tiles everytime a player moves 
  # Show the board every player move
  # Record each player moves

# Players 
  # Can choose which tile number to place their symbol


Methods that can be used:

string.sub

Methods used for rendering the board:
String formatting:
  %d
Array methods:
  array.each_slice(board_size).to_a