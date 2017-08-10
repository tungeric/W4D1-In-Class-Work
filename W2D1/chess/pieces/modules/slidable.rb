module Slidable

  def get_moves # deltas is straights and/or diagonals
    all_moves = []
    self.class::DELTAS.each do |delta|
      all_moves << directional_path(delta)
    end
    paths_until_piece(all_moves)
  end

  def directional_path(delta)
    moves_in_cur_direction = []
    (1..7).each do |distance| ##position = [2, 3] delta = [-1, 1] => [[1, 4], [0,5], [-1, 6], [-2, 7], [-3,8], [-4,9], [-5,10]]
                                                          #distance:  0       1       2       3       4         5       6
      moves_in_cur_direction << @position.map.with_index do |val, i| # map is returning e.g. [1,4]  #val is always 2 first, then 3
        val + delta[i] * distance #block is returning individual value in map's return... e.g. 1.   or 4.
        #2         delta[3]     #delta => [-1,1]
        # 1
      end
    end
    moves_in_cur_direction.select { |pos| @board.in_bounds?(pos) }
  end


  def paths_until_piece(all_moves)
    result = []
    all_moves.each do |delta_path|
      delta_path.each do |pos|
        result << pos if @board[pos].is_a?(NullPiece) || @board[pos].player != @player
        break unless @board[result.last].is_a?(NullPiece)
      end
    end
    result
  end
end
