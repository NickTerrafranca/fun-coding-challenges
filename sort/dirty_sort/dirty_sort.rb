# A silly and unrealistic sorting algorithm of my own devising.
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

