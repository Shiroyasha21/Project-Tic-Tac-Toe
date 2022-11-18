# frozen_string_literal: false

require_relative 'board'
require_relative 'player'
require_relative 'gamerules'

# Starting the game
class TicTacToe
  include GameRules
  attr_reader :used_moves

  @@used_moves = []

  def initialize
    take_player_detail
    @game = Board.new
    out_of_moves
    take_player_move(@player1)
    take_player_move(@player2)
    play_game
  end

  def play_game
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
    @@used_moves = []
    if @win_status == true
      puts "#{@winner} win the game."
    else
      puts 'The game is a draw.'
    end
    game_restart
  end

  def game_restart
    puts 'Want to start a new game? Enter Y if yes and N if no: '
    answer = gets.chomp.upcase

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
