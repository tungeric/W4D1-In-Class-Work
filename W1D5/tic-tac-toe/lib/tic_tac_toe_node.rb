require_relative 'tic_tac_toe'

class TicTacToeNode
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  # Human player goes first and has symbol :X
  def losing_node?(evaluator)
    if @board.over?
      return @board.winner == :o ? true : false
    end
    if (@board.winner == :x &&
        @board.children.all? { |child| losing_node?(child)}) ||
        (@board.winner == :o &&
        @board.children.any? { |child| losing_node?(child)})
        return true
    end
    false
  end

  def winning_node?(evaluator)
    if @board.over?
      return @board.winner == :x ? true : false
    end
    if (@board.winner == :x &&
        @board.children.any? { |child| winning_node?(child)}) ||
        (@board.winner == :o &&
        @board.children.all? { |child| winning_node?(child)})
        return true
    end
    false
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    empty_positions = positions.select do |pos|
      @board[pos].nil?
    end
    empty_positions.map do |pos|
      board_dup = @board.dup
      board_dup[pos] = @next_mover_mark
      prev_mover_mark = @next_mover_mark == :x ? :o : :x
      TicTacToeNode.new(board_dup, prev_mover_mark, pos)
    end
  end

  def positions
    ((0..2).to_a).product((0..2).to_a)
  end
end
