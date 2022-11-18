# frozen_string_literal: true

# Board and its purpose
class Board
  attr_accessor :tiles

  def initialize
    @form = (' ' * 6) + (' %1c | %1c | %1c ')
    @frame = (' ' * 6) + (('-' * 3) + '+') * 2 + ('-' * 3)
    @tiles = [*'1'...'10'].each_slice(3).to_a
    render_board
  end

  def render_board
    puts "\e[H\e[2J"
    @tiles.each_with_index do |row, index|
      if index.zero?
        puts(@form % row)
      else
        puts @frame
        puts(@form % row)
      end
    end
    puts ''
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
