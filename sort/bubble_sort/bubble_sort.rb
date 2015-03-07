require 'pry'

def bubble_sort(list)
  if list == []
    return list
  end

  end_of_list = list.length - 1
  is_sorted = false
  swpapped = false
  left = 0
  right = 1

  while is_sorted == false

    if swpapped == false && right == end_of_list
      is_sorted = true

    elsif list[left] > list[right]
      list[left], list[right] = list[right], list[left]
      swpapped = true
      if right == end_of_list
        left = 0
        right = 1
        swpapped = false
        # if end_of_list > 1
        #   end_of_list -=1
        # end
      else
        left +=1
        right +=1
      end

    elsif right == end_of_list
      left = 0
      right = 1
      swpapped = false
    else
      left +=1
      right +=1
    end

  end
  list
end
# p bubble_sort([3, 7, 5, 6, 4, 0, 1, 2, 9, 8])
