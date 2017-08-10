require_relative 'tile.rb'
require 'colorize'

class Board
  def initialize(dimensions = [9,9])
    @dimensions = dimensions
    @grid = Array.new(dimensions[0]) { Array.new(dimensions[1]) { Tile.new } }
  end

  def render
    ending_letter = num_to_letter(@dimensions[1])

    puts "   #{('A'...ending_letter).to_a.join(' ')}"
    @grid.each_with_index do |row, idx|
      puts "#{num_to_letter(idx)} #{" #{row.join(' ')} ".on_light_white}"
    end
  end

  def num_to_letter(num)
    ('A'..'Z').to_a[num]
  end

  def letter_to_num(char)
    ('A'..'Z').to_a.index(char.upcase)
  end

  def list_of_coordinates
    (0...@dimensions[0]).to_a.product((0...@dimensions[1]).to_a)
  end

  def [](pos)
    row, col = pos
    return nil unless @grid[row]
    @grid[row][col]
  end

  # def []=(pos, val)
  #   row, col = pos
  #   @grid[row][col] = val
  # end
end

if __FILE__ == $0
  b = Board.new
  b.render
end
