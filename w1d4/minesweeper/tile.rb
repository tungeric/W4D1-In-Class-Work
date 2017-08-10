require 'colorize'

class Tile
  attr_accessor :value, # value is either '@' or ' ' or a number
              :status # :untouched || :flagged || :revealed

  def initialize
    # @status = :untouched # :untouched || :flagged || :revealed
    @status = :revealed # :untouched || :flagged || :revealed
    @value = ' '
  end

  def to_s
    if @status == :revealed
      @value
    elsif @status == :flagged
      MinesweeperGame::FLAG
    else # @status == :untouched
      '*'
    end
  end

  def reveal!

  end
end
