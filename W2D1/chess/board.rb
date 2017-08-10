
require_relative './pieces/king.rb'
require_relative './pieces/queen.rb'
require_relative './pieces/bishop.rb'
require_relative './pieces/knight.rb'
require_relative './pieces/rook.rb'
require_relative './pieces/pawn.rb'
require_relative './pieces/null_piece.rb'



class Board
  attr_reader :grid

  def populate_board
    [
      home_row_populate(@game.player2),
      pawn_populate(@game.player2),
      *Array.new(4) { |idx| Array.new(8) { NullPiece.instance } },
      pawn_populate(@game.player1),
      home_row_populate(@game.player1)
    ]
  end

  def pawn_populate(player)
    row = player.color == :black ? 1 : 6
    Array.new(8) {|col| Pawn.new(self, player, [row, col])}
  end

  def home_row_populate(player)
    row = player.color == :black ? 0 : 7
    [
      Rook.new(self, player, [row, 0]),
      Knight.new(self, player, [row, 1]),
      Bishop.new(self, player, [row, 2]),
      Queen.new(self, player, [row, 3]),
      King.new(self, player, [row, 4]),
      Bishop.new(self, player, [row, 5]),
      Knight.new(self, player, [row, 6]),
      Rook.new(self, player, [row, 7])
    ]
  end

  def initialize(game)
    @game = game
    @grid = populate_board
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def move_piece(start_pos, end_pos)
    raise ArgumentError, "There is no piece at #{start_pos}." if self[start_pos].nil?
    piece = self[start_pos]
    raise ArgumentError, "You can't move to #{end_pos}!" unless piece.valid_move?(end_pos)
    self[end_pos] = piece
    self[start_pos] = NullPiece.instance
    piece.update_pos(end_pos)
  end

  def in_bounds?(pos)
    pos.all? { |idx| (0..7).include?(idx) }
  end

end


if __FILE__ == $0
  b = Board.new
  b.grid.each do |row|
    p row
  end
  b.move_piece([3,0], [3, 2])
  p '**************'
  b.grid.each do |row|
    p row
  end
end
