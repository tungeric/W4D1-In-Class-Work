class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    accumulator = 0

    ["Array", *self].each_with_index do |el, i|
      accumulator += (el.hash + i).hash
    end
    accumulator.hash
  end
end

class String
  def hash
    string_hash = ('String' + self)
      .each_byte
      .map.with_index do |byte, i|
        i.to_s.concat(byte.to_s).to_i.hash
      end

    string_hash.inject(:^)
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    ("Hash" + self.sort.hash.inspect).hash
  end
end

if __FILE__ == $0
  hash1 = {a: 0, b: 1}
  hash2 = {b: 1, a: 0}

  # p hash1.hash
  # p hash2.hash
  #
  # p [hash1, hash2].hash
  # p [hash2, hash1].hash
  #
  # p [[hash1], hash2].hash
  # p [[hash2], hash1].hash
  #
  # hash3 = {hash1 => 'a'}
  # hash4 = {hash2 => 'a'}
  #
  # p hash3.hash
  # p hash4.hash
end
