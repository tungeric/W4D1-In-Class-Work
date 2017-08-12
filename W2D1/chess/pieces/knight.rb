require_relative "piece.rb"
require_relative "./modules/stepable.rb"

class Knight < Piece
  include Stepable
  DELTAS  = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [-1, 2], [1, -2], [-1, -2]]

  def to_s
    if @player.color == :white
      '♘ '
    else
      '♞ '
    end
  end

end
