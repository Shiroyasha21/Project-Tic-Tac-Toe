# frozen_string_literal: true

# The module has the rules of the Tic Tac Toe game and the winning condition
module GameRules
  def check_for_winner(array_of_moves)
    array = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 6],
            [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    array.any? { |move| move.intersection(array_of_moves) == move }
  end
end
