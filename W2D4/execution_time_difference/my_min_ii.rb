require 'benchmark'
# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
list = Array.new(500_000) {rand(51)}

def my_min_ii(list)
  start = list.first

  list.each do |el|
    start = el if el < start
  end

  start
end


if __FILE__ == $0
  p Benchmark.realtime { my_min_ii(list) }
end
