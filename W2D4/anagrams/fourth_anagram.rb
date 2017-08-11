def fourth_anagram(str1, str2)
  str1and2hash_yep = Hash.new(0)

  (str1 + str2).chars.each do |ch|
    str1and2hash_yep[ch] += 1
  end

  str1and2hash_yep.values.all(&:even?)

end

if __FILE__ == $0
  p fourth_anagram("elvis", "lives")
end
