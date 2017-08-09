require 'deck'

describe Deck do
  subject(:deck) {Deck.new}

  context "at creation" do
    it "initializes with 52 cards" do
      expect(deck.bank.count).to eq(52)
    end

    it "is shuffled" do
      expect(deck.bank.sort).to_not eq(deck.bank)
      expect(deck.bank.sort).to match_array(deck.bank)
    end

    it "only contains unique objects" do
      strings = deck.bank.map(&:to_s)
      expect(strings.uniq.length).to eq(52)
    end

  end

  context "during game" do
    it "should be drawn from"

    it 'should be able to draw more than one card'

    it "should be randomized after each hand"

  end


end
