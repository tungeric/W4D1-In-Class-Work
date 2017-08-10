module Stepable

  def get_moves
    valid_moves
  end

  def all_directions
    self.class::DELTAS.map do |delta|
      @position.map.with_index do |val, i|
        val + delta[i]
      end
    end
  end

  def in_bound_moves
    all_directions.select { |pos| @board.in_bounds?(pos) }
  end

  def valid_moves
    in_bound_moves.reject { |pos| @board[pos].is_a?(Piece) && @board[pos].player == @player }
  end


end
