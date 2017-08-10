class Board
  def initialize
    @grid = Array.new(4) {Array.new(4)}
    populate
  end

  def populate
    card_values = (1..8).to_a * 2
    card_values.shuffle!
    @grid.each do |row|
      row.map! do |space|
        Card.new(card_values.pop)
      end
    end
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def won?
    @grid.flatten.all?{|card| card.revealed?}
  end

  def reveal(pos)
    self[pos].reveal!
  end

  def hide_guesses(*args)
    args.each { |pos| self[pos].hide! }
  end

  def render
    @grid.each do |row|
      puts row.join(' ')
    end
  end

end
