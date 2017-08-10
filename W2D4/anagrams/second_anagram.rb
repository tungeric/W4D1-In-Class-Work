def second_anagram(str1, str2)
  str1_dup = str1.dup
  str2_dup = str2.dup

  str1.each_char do |ch|
    if str2.include?(ch)
      str1_dup.delete!(ch)
      str2_dup.delete!(ch)
    end
  end

  str1_dup.empty? && str2_dup.empty?
end

if __FILE__ == $0
  p second_anagram("elvis", "lives")
end
