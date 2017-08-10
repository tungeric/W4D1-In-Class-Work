require 'colorize'
require_relative 'board.rb'

class Display
  def initialize(cursor, board)
    @cursor = cursor
    @board = board
  end

  def render
    loop do
      system("clear")
      @board.grid.each_with_index do |row, idx1|
        row.each_with_index do |col, idx2|
          white = (idx2 - idx1).even?
          if @cursor.cursor_pos == [idx1, idx2]
            print col.to_s.on_light_red
          elsif white
            print col.to_s.on_light_white
          else
            print col.to_s.on_light_black
          end
        end
        puts ""
      end
      input = @cursor.get_input
      return input if input
    end
  end

  private

  def move(new_pos)

  end

end
