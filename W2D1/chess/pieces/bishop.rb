require_relative "piece.rb"
require_relative "./modules/slidable.rb"

class Bishop < Piece
  include Slidable
  DELTAS = [[-1, 1], [1, -1], [-1, -1], [1, 1]]

  def to_s
    if @player.color == :white
      '♗ '
    else
      '♝ '
    end
  end

end
