require 'benchmark'

NUMBER = 1000

def fib_fast(n)
  sequence = []
  (n + 1).times do |i|
    if i == 0
      sequence[i] = 0
    elsif i == 1
      sequence[i] = 1
    else
      sequence[i] = sequence[i-1] + sequence[i-2]
    end
  end
  sequence[n]
end
p fib_fast(NUMBER)
puts Benchmark.measure { fib_fast(NUMBER) }
