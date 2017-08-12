def first_anagram(str1, str2)
  str1.chars
    .permutation.to_a
    .map(&:join)
    .include?(str2)
end

if __FILE__ == $0
  p first_anagram("elvis", "lives")
end
