def fifth_anagram(str1, str2)
  return false if str2.length > str1.length
  i = 0
  memo = 0
  while i < str1.length
    memo ^= str1[i].ord ^ str2[i].ord
    i += 1
  end
  memo.zero?
end

if __FILE__ == $0
  p fifth_anagram("elvistt", "livesss")
end
