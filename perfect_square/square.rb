def squares(array)
  square_nums = []
  array.each do |i|
    sqrt = i ** 0.5
    if sqrt - sqrt.to_i == 0
      square_nums << i
    end
  end
  square_nums
end
