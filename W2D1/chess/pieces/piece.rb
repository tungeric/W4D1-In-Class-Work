class Piece
  attr_reader :player

  def initialize(board, player, pos)
    @board = board
    @player = player
    @position = pos
  end

  def valid_move?(pos)
    true
  end

  def update_pos(pos)
    @position = pos
  end



end
