require 'benchmark'
# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
list = Array.new(5_000) {rand(51)}

def largest_contiguous_subsum(list)
  subset_sum_max = -1.0 / 0

  (0...list.length).each do |i|
    (i.next...list.length).each do |j|
      sum = list[i..j].inject(0, :+)
      subset_sum_max = [subset_sum_max, sum].max
    end
  end
  subset_sum_max
end

if __FILE__ == $0
  p Benchmark.realtime { largest_contiguous_subsum(list) }
end
