# The module has the rules of the Tic Tac Toe game and the winning condition
module GameRules
  def check_for_winner(array_of_moves)
    array = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 6],
            [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    array.any? { |move| move.intersection(array_of_moves) == move }
  end
end

# Player name and symbol
class Player
  attr_accessor :name, :symbol, :player_moves

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @player_moves = []
  end

  def move(move)
    @move = move
    @player_moves << move
  end

  def turn_for_player1
    puts "#{@name} please choose a numbered tile for your move:"

    input = gets.chomp.to_i
    while @used_moves.any?(input) || input.zero?
      puts 'The choosen tile is not available'
      input = gets.chomp.to_i
    end
    move = input
    @used_moves << move
    player1.move(move)
  end
end

# Board and its purpose
class Board
  attr_accessor :tiles

  def initialize
    @form = '| %1c ' * 3 + '|'
    @frame = ('+' + ('-' * 3)) * 3 + '+'
    @tiles = [*'1'...'10'].each_slice(3).to_a
    render_board
  end

  def render_board
    @tiles.each do |row|
      puts @frame
      puts(@form % row)
    end
    puts @frame
  end

  def change_tiles(move, symbol)
    move = move.to_s
    @tiles.map! do |row|
      row.each_with_index do |element, index|
        if element == move
          row[index] = symbol
        end
      end
    end
    render_board
  end
end

# Starting the game
class TicTacToe
  include GameRules

  def initialize
    take_player_detail
    Board.new
  end

  def take_player_detail
    for i in 1..2
      puts "Please enter player #{i}: "

      @name = gets.chomp.to_s.capitalize
      player2 = Player.new(@name, 'X') if i > 1
      player1 = Player.new(@name, 'O')
    end
  end

  def used_moves
    @used_moves = []
  end

  def turn_for_player1
    puts "#{player1.name} please choose a numbered tile for your move:"

    input = gets.chomp.to_i
    while @used_moves.any?(input) || input.zero?
      puts 'The choosen tile is not available'
      input = gets.chomp.to_i
    end
    move = input
    @used_moves << move
    player1.move(move)
  end
end