def quick_sort(list, start_point = nil, end_point = nil)
  # This enables the initial call to quick_sort to require only the array as an argument
  if start_point && end_point
    if start_point >= end_point
      return list
    end
    left = start_point
    right = end_point
    pivot = left
  else
    left = 0
    right = list.index(list[-1])
    pivot = left
  end

  # These variables preserve the initial start and end points for later recursive calls
  min = left
  max = right

  while left < right
    if list[pivot] < list[right]
      right -= 1
    else
      p = list[pivot]
      r = list[right]
      list[pivot] = r
      list[right] = p
      pivot = right
    end

    if list[pivot] > list[left]
      left += 1
    else
      p = list[pivot]
      l = list[left]
      list[pivot] = l
      list[left] = p
      pivot = left
    end
  end

  quick_sort(list, min, pivot -1) # Recursively sort the left array
  quick_sort(list, pivot +1, max) # Recursively sort the right sub array
end
