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
  attr_reader :used_moves

  @@used_moves = []

  def initialize
    take_player_detail
    @game = Board.new
    out_of_moves
    play_game
  end

  def play_game
    take_player_move(@player1)
    take_player_move(@player2)
    until @win_status == true || @out_of_moves == true
      take_player_move(@player1)
      check_for_win
      out_of_moves
      break if @win_status == true || @out_of_moves == true

      take_player_move(@player2)
      check_for_win
      out_of_moves
    end
    game_over
  end
  
  def check_for_win
    @winner = ''
    @win_status = false
    if check_for_winner(@player1.player_moves)
      @winner.concat(@player1.name)
      @win_status = true
      return true
    elsif check_for_winner(@player2.player_moves)
      @winner.concat(@player2.name)
      @win_status = true
      return true
    end
    false
  end

  def out_of_moves
    @out_of_moves = false
    @out_of_moves = true if @@used_moves.length == 9
  end

  def game_over
    if @win_status == true
      puts "#{@winner} win the game."
    else
      puts 'The game is a draw.'
    end
    game_restart
  end

  def game_restart
    puts 'Want to start a new game? Enter Y if yes and N if no: '
    answer = gets.chomp

    if answer == 'Y'
      TicTacToe.new
    else
      puts 'Thank you for playing!'
    end
  end

  def take_player_detail
    for i in 1..2
      puts "Please enter player #{i} name: "

      name = gets.chomp.to_s.capitalize
      return @player2 = Player.new(name, 'O') if i == 2

      @player1 = Player.new(name, 'X')
    end
  end

  def take_player_move(player)
    puts ''
    puts "#{player.name} please choose a numbered tile for your move:"

    @move_input = gets.chomp.to_i
    check_move

    register_move(player, @move_input)
  end

  def check_move
    while @@used_moves.any?(@move_input) || @move_input.zero? || @move_input > 9
      puts 'The choosen tile is not available'
      @move_input = gets.chomp.to_i
    end
  end

  def register_move(player, move)
    @@used_moves << move
    player.move(move)
    symbol = player.symbol
    @game.change_tiles(move, symbol)
  end
end

TicTacToe.new