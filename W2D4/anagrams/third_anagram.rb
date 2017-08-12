def third_anagram(str1, str2)
  str1.chars.sort == str2.chars.sort

end

if __FILE__ == $0
  p third_anagram("elvis", "lives")
end
