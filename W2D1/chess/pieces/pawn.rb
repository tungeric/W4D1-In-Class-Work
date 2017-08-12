require_relative "piece.rb"

class Pawn < Piece

  def to_s
    if @player.color == :white
      '♙ '
    else
      '♟ '
    end
  end

end
