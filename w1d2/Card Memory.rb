class Card

  attr_reader :value

  def initialize(value)
    @value = value
    @face_up = false
  end

  def reveal!
    @face_up = true
  end

  def hide!
    @face_up = false
  end

  def revealed?
    @face_up
  end

  def to_s
    @face_up ? "|#{@value}|" : "|X|"
  end

  def ==(comparator)
    @value == comparator.value
  end

end
