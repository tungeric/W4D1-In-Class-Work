# When approaching each problem, make sure to:
#
# Read the entire problem statement.
# Talk with your partner to identify test cases and key functionality to
#   expect from your code.
# Write RSpec tests.
# Write the method you now have tests for. Follow the red-green-refactor
#   approach until all specs pass.

def my_uniq(arr)
  uniques = []
  arr.each do |el|
    uniques << el unless uniques.include?(el)
  end
  uniques
end

def two_sum(arr)
  results = []
  arr.each_with_index do |element1, idx1|
    (idx1.next...arr.length).each do |idx2|
      results << [idx1, idx2] if element1 + arr[idx2] == 0
    end
  end
  results
end
