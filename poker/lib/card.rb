class Card
  include Comparable
  attr_reader :suit, :value

  CARD_RANKING = {
    :'2' => 2,
    :'3' => 3,
    :'4' => 4,
    :'5' => 5,
    :'6' => 6,
    :'7' => 7,
    :'8' => 8,
    :'9' => 9,
    :'10' => 10,
    J: 11,
    Q: 12,
    K: 13,
    A: 14
  }

  SUIT_MAP = { spade: "♠️", heart: "♥️", diamond: "♦️", club: "♣️" }

  def initialize(suit, val)
    @suit = suit
    @value = val
  end

  def <=>(comparator)
    [CARD_RANKING[@value], @suit] <=> [CARD_RANKING[comparator.value], comparator.suit]
  end

  def compare_values(comparator)

  end

  def compare_suit(comparator)

  end

  def to_s
    suit = SUIT_MAP[@suit]
    value = @value.to_s
    suit + " " + value
  end

end
