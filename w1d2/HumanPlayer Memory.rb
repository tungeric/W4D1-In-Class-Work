class HumanPlayer

  attr_reader :name

  def initialize(name="Human")
    @name = name
    @match_count = 0
  end

  def guess
    puts "Please enter the positions of a card to flip"
    gets.chomp.split(/\,?\s*/).map(&:to_i)
  end

  def remove_valid_positions(*args); end

  def receive_revealed_card(pos, value)
  end

  def receive_match(*args)
  end
end
