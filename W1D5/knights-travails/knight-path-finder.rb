require_relative 'poly-tree-node'

class KnightPathFinder
  DELTAS = [[-2,-1], [-2,1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]

  def self.valid_moves(pos)
    valid_moves = []
    curr_x, curr_y = pos
    DELTAS.each do |(delta_x, delta_y)|
      new_pos = [curr_x + delta_x, curr_y + delta_y]
      valid_moves << new_pos if self.real_move?(new_pos)
    end
    valid_moves
  end

  # Position only valid if index is between 0 and 7
  def self.real_move?(pos)
    pos.all? do |val|
      (0..7).include?(val)
    end
  end

  def initialize(pos)
    @root = PolyTreeNode.new(pos)
    @visited_positions = []
    build_move_tree
  end

  def new_move_positions(pos)
    valid_moves = KnightPathFinder.valid_moves(pos)
    valid_moves.reject! {|position| @visited_positions.include?(position)}
    @visited_positions += valid_moves
    valid_moves
  end

  def build_move_tree
    queue = [@root]
    until queue.empty?
      curr_pos = queue.shift
      new_moves = new_move_positions(curr_pos.value)
      new_moves.each do |child_pos|
        curr_pos.add_child(PolyTreeNode.new(child_pos))
      end
      queue += curr_pos.children
    end
    @root
  end

  def find_path(end_pos)
    end_node = @root.bfs(end_pos)
    track_back_path(end_node)
  end

  def track_back_path(end_node)
    backwards_path = []
    until end_node.nil?
      backwards_path << end_node.value
      end_node = end_node.parent
    end
    backwards_path.reverse
  end

end

if __FILE__ == $0
  kf = KnightPathFinder.new([4,4])
  p kf.find_path([6,5])

  kpf = KnightPathFinder.new([0, 0])
  p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
  p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]
end
