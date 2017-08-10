class PolyTreeNode
  attr_accessor :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def value
    @value
  end

  def parent=(node)
    if @parent
      @parent.children.delete(self)
    end
    node.children << self unless node.nil?
    @parent = node
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "Argument #{child_node} is not a child!" unless @children.include?(child_node)
    child_node.parent = nil
  end

  def dfs(target_value)
    return self if @value == target_value
    @children.each do |child_node|
      ans = child_node.dfs(target_value)
      return ans unless ans.nil?
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      current = queue.shift
      return current if current.value == target_value
      queue += current.children
    end
    nil
  end

  def inspect
    {value: @value, parent: @parent}.inspect
  end

end
