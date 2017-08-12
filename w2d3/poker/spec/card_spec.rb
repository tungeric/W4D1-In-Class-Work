require 'card'

describe Card do
  subject(:card) { Card.new(:spade, :A) }
  let(:other_card) {Card.new(:diamond, :'3') }

  it "has a suit" do
    expect(subject.suit).to eq(:spade)
    expect(other_card.suit).to eq(:diamond)
  end

  it "has a value" do
    expect(subject.value).to eq(:A)
    expect(other_card.value).to eq(:'3')
  end

  it "can be compared" do
    expect(subject).to be > other_card
  end

  it "can be stringified properly" do
    expect(subject.to_s).to eq('♠️ A')
    expect(other_card.to_s).to eq('♦️ 3')
  end
end
