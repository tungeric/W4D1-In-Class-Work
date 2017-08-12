require 'benchmark'

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
list = Array.new(500_000) {rand(51)}

def my_min(list)  # =>  -5
  min = nil
  list.each do |el|
    is_min = true
    # return el if list.all? { |el2| el2 >= el } # FEELING BETTER?
    list.each do |el2|
      is_min = false if el2 < el
    end
    min = el if is_min
  end
  min
end

if __FILE__ == $0
  p Benchmark.realtime { my_min(list) }
end
