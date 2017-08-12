class ComputerPlayer
  attr_reader :name

  def initialize(name='Computer')
    @name = name
    @unmatched_cards = {}
    @pending_match = []
    @valid_positions = (0..3).to_a.repeated_combination(2).to_a
    @match_count = 0
  end

  def guess
    if @pending_match.empty?
      @valid_positions.sample
    else
      @pending_match.pop
    end
  end

  def receive_revealed_card(pos, value)
    if @unmatched_cards[value]
      @pending_match += [pos, @unmatched_cards[value]]
    else
      @unmatched_cards[value] = pos
    end
  end

  def receive_match(*args)
    @pending_match = []
    remove_valid_positions(*args)
  end

  def remove_valid_positions(*args)
    args.each do |pos|
      @valid_positions.delete(pos)
    end
    @valid_positions
  end




end
