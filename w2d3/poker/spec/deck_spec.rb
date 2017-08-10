require 'deck'

describe Deck do
  subject(:deck) { Deck.new }

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

    context "#draw" do
      let(:new_card) { deck.draw! }

      it "should be drawn from" do
        new_card
        expect(deck.bank.length).to eq(51)
      end

      it "should return an array when drawn from" do
        expect(new_card).to be_a(Array)
      end

      it "should be an array of one card by default" do
        expect(new_card.length).to eq(1)
      end

      it "should be able to have more than one card drawn from it" do
        new_cards = deck.draw!(5)
        expect(new_cards.length).to eq(5)
        expect(deck.bank.length).to eq(47)
      end

      it "should remove the drawn cards from the bank" do
        new_cards = deck.draw!(4)
        expect(new_cards.any? { |card| deck.bank.include?(card) }).to be false
      end

      it "draw unique cards" do
        new_cards = deck.draw!(20)
        expect(new_cards.all? { |card| new_cards.count(card) == 1 }).to be true
      end
    end

    it "should be drawn from" do
      new_card = deck.draw!
      expect(new_card).to be_a(Array)
      expect(new_card.length).to eq(1)
      expect(deck.bank.length).to eq(51)
    end

    context "#shuffle" do
      it "should randomize the deck" do
        bank = deck.bank.dup
        deck.shuffle!
        expect(deck.bank).to_not eq(bank)
      end

    end

  end


end
