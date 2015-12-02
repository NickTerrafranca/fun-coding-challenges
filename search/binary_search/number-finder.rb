require 'benchmark'

def find_number(num, high)
  raise ArgumentError.new("First argument must be less than second argument") if high < num
  raise ArgumentError.new("First argument must be between 0 and #{high}") if num < 0 || num > high
  low = 0
  calc = ->(x,y) { (x + y) / 2 }
  mid = calc.call(low, high)
  while low <= high
    if mid == num
      return mid
    elsif num < mid
      high = mid -1
      mid = calc.call(low, high)
    elsif num > mid
      low = mid + 1
      mid = calc.call(low, high)
    end
  end
end

Benchmark.bm do |x|
  40.times { x.report { find_number(rand(1000000000001), 1000000000000) } }
end
