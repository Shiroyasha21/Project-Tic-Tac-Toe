# The module has the rules of the Tic Tac Toe game and the winning condition
module GameRules
  def check_for_winner(array_of_moves)
    array = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 6],
            [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    array.any? { |move| move.intersection(array_of_moves) == move }
  end
end

# Player name and symbol
class Players
  attr_reader :move
  attr_accessor :name, :symbol
end

# Board and its purpose
class Board
  attr_reader :tiles

  def initialize
    @form = "| %1d " * 3 + "|"
    @frame = ("+" + ("-" * 3)) * 3 + "+"
    @tiles = [*1...10].each_slice(3).to_a
    @tiles.each do |row|
      puts @frame
      puts(@form % row)
    end
    puts @frame
  end

  def change_tiles(move)
    @tiles.map! do |row|
      row.each_with_index do |element, index|
        if element == move
          row[index] = @symbol
        end
      end
    end
  end
end

# Starting the game
class TicTacToe
  include GameRules

  def initialize
    get_player_detail
    Board.new
  end

  def take_player_detail
    for i in 1..2
      puts "Please enter player #{i} and symbol"
      name = gets.chomp
      symbol = gets.chomp
      player_2 = Players.new(name, symbol) if i > 1
      player_1 = Players.new(name, symbol)
    end
  end
end
