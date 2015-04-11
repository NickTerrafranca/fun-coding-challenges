require 'pry'

flights = [['LAX', 'BWI'], ['SEA', 'HNL'], ['BOS', 'SEA'], ['HNL', 'LAX']]

def find_start_point(list)
  start_point = nil
  eval_index = 0
  size = list.size - 1
  counter = 0

  while counter <= size
    list.each do |flight|
      if list[eval_index][0] == flight[1]
        eval_index += 1
        counter += 1
        binding.pry
      else
        start_point = eval_index
        counter += 1
        binding.pry
      end
      # counter += 1
    end
  end

  p start_point
end

find_start_point(flights)
