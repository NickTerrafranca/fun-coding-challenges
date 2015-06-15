def bubble_sort(list)
  return list if list == []
  end_of_list = list.length - 1
  is_sorted = false
  swapped = false
  left = 0
  right = 1

  while is_sorted == false
    if swapped == false && left == end_of_list
      is_sorted = true
    elsif list[left] > list[right]
      list[left], list[right] = list[right], list[left]
      swapped = true
      if right == end_of_list
        left = 0
        right = 1
        swapped = false
        end_of_list -= 1
      else
        left += 1
        right += 1
      end
    elsif right == end_of_list
      left = 0
      right = 1
      swapped = false
      end_of_list -= 1
    else
      left += 1
      right += 1
    end
  end
  list
end
