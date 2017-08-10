require 'benchmark'
list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
list = [2, 3, -6, 7, -6, 7]
# list = Array.new(5_000) {rand(-50..50)}

def largest_contiguous_subsum_ii(list)
  all_neg = true
  max_el = -Float::INFINITY

  max_subset_sum = 0
  current_subset_sum = 0

  start_idx = 0
  end_idx = 0

  while end_idx < list.length
    el = list[end_idx]

    max_el = el if el > max_el
    all_neg = false if el >= 0

    current_subset_sum += el
    max_subset_sum = current_subset_sum if current_subset_sum > max_subset_sum
    if current_subset_sum < 0
      start_idx = end_idx.next
      current_subset_sum = 0
    end
    end_idx += 1
  end

  all_neg ? max_el : max_subset_sum
end


if __FILE__ == $0
  p Benchmark.realtime { p largest_contiguous_subsum_ii(list) }
end
