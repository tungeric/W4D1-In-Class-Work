require "tdd"

describe "#my_uniq" do
  subject(:array) { [1,2,1,3,2,3,1,3,1] }
  let(:result) { my_uniq(array) }

  it "removes duplicates" do
    expect(result.all? {|el| result.count(el) == 1 }).to be true
  end

  it "doesn't mutate original array" do
    expect(array).to eq([1,2,1,3,2,3,1,3,1])
  end

  it "maintains order of appearance" do
    expect(result).to eq([1,2,3])
  end

  # Suggested Test: Doesn't call built in uniq (but circumstantial).
  it "doesn't use the built in uniq method" do
    expect(array).not_to receive(:uniq)
    my_uniq(array)
  end

end

describe "#two_sum" do
  subject(:array) {[0,2,1,-2,-1]} #=> [[1,3], [2,4]]
  let(:result) {[[1,3], [2,4]]}

  it "sums pairs" do
    expect(two_sum(array)).to eq(result)
  end
  it "sorts by index" do
    sbi = two_sum(array)
    expect(sbi).to eq(sbi.sort)
  end
  it "is made of nested arrays" do
    expect(two_sum(array).all? {|el| el.is_a?(Array)}).to be true
  end
  it "doesn't return repeats" do
    sbi = two_sum(array)
    sbi += sbi.map(&:reverse)
    expect(sbi).to eq(sbi.uniq)

  end
end
