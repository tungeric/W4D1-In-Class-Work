class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&prc)
    result = []
    self.my_each do |el|
      result << el if prc.call(el)
    end
    result
  end

  def my_reject(&prc)
    result = []
    self.my_each do |el|
      result << el unless prc.call(el)
    end
    result
  end

  def my_any?(&prc)
    result = false
    self.my_each do |el|
      result = true if prc.call(el)
    end
    result
  end

  def my_all?(&prc)
    result = true
    self.my_each do |el|
      result = false unless prc.call(el)
    end
    result
  end

  def my_flatten
    return self unless self.my_any? {|el| el.is_a?(Array)} #base case
    flatten_one_lvl = self.flat_map {|el| el}
    flatten_one_lvl.my_flatten
  end

  def my_zip(*args)
    self.map.with_index do |el1, idx1|
      result = [el1]
      args.each do |el2|
        result << el2[idx1]
      end
      result
    end

  end

  def my_rotate(num_rotations=1)
    result = self.dup

    num_rotations.abs.times do
      if num_rotations > 0
        result << result.shift
      else
        result.unshift(result.pop)
      end
    end
    result
  end

  def my_join(separator="")
    result = self.first.dup
    self[1..-1].each do |el|
      result << separator
      result << el
    end
    result
  end

  def my_reverse
    result = []
    i = -1
    while i >= -self.length
      result << self[i]
      i -= 1
    end
    result
  end


end
