require_relative "piece.rb"
require_relative "./modules/slidable.rb"

class Rook < Piece
  include Slidable
  DELTAS = [[-1, 0], [0, 1], [1, 0], [0, -1]]

  def to_s
    if @player.color == :white
      '♖ '
    else
      '♜ '
    end
  end

end
