require 'pry'

flights = [['LAX', 'BWI'], ['SEA', 'HNL'], ['BOS', 'SEA'], ['HNL', 'LAX']]

def find_start_point(list)
  same = []
  list.each do |a|
    list.each do |b|
      if a[0] == b[1]
        same << a
      end
    end
  end
  delta = list-same
  delta = delta.flatten
  start_point = list.index(delta)
end
puts find_start_point(flights)
