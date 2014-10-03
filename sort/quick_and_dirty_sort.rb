require 'pry'

def dirty_sort(list)
  sorted = []
  l = list.length
  while list.length > 0
    n = list[0]
    list.each do |i|
      if i <= n
        n = i
      end
    end
  sorted.push(n)
  list.delete(n)
  end
  # binding.pry
  sorted
end

list = [75, 100, -1, 85, 65, 84, 87, 95]
puts dirty_sort(list)
