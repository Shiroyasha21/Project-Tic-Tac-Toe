# frozen_string_literal: true

# Player name and symbol
class Player
  attr_accessor :name, :symbol, :player_moves

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @player_moves = []
  end

  def move(move)
    @player_moves << move
  end
end
