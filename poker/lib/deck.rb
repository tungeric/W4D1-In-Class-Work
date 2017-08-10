require_relative 'card'

class Deck

  attr_reader :bank

  def self.make_random_bank
    card_attrs = Card::SUIT_MAP.keys.product(Card::CARD_RANKING.keys)
    bank = card_attrs.map {|suit,value| Card.new(suit,value) }
    bank.shuffle
  end

  def initialize
    @bank = Deck.make_random_bank
  end

  def draw!(num_cards = 1)
    @bank.pop(num_cards)
  end

  def shuffle!
    @bank.shuffle!
  end


end
