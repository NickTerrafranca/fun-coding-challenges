def factorial(n)
  if n < 0
    raise ArgumentError.new("Argument cannot be negative")
  elsif n <= 1
    1
  else
    binding.pry
    n * factorial(n - 1)
  end
end
