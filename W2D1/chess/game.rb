require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'cursor.rb'
require_relative 'display.rb'



class Game
  attr_reader :player1, :player2

  def initialize
    @player1 = Player.new(:white)
    @player2 = Player.new(:black)
    @board = Board.new(self)
  end
end

if __FILE__ == $0
  g = Game.new
  b = Board.new(g)
  c = Cursor.new([0, 0], b)
  d = Display.new(c, b)
  b.move_piece([0,1], [4,4])
  # d.render
  p b[[4,4]].get_moves.sort
end
