require 'pry'

def dirty_sort(list)
  sorted = []
  while list.length > 0
    n = list[0]
    list.each do |i|
      if i < n
        n = i
      end
    end
  l = list.index(n)
  sorted << list.slice!(l)
  end
  sorted
end

list = [75, 100, -1, 85, 65, 84, 87, 65, 95]
puts dirty_sort(list)
