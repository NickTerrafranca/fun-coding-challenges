require 'benchmark'

NUMBER = 35

def fibonacci(n)
  if n == 1 || n == 2
    1
  else
    fibonacci(n - 1) + fibonacci(n - 2)
  end
end

puts fibonacci(NUMBER)
puts Benchmark.measure { fibonacci(NUMBER) }
