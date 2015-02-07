def quick_sort(list, start_point = nil, end_point = nil)
  if list == []
    return []
  end
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
    right = list.count - 1
    pivot = left
  end

  # These variables preserve the initial start and end values for later recursive calls
  min = left
  max = right

  while left < right
    if list[pivot] < list[right]
      right -= 1
    else
      list[pivot], list[right] = list[right], list[pivot]
      pivot = right
    end

    if list[pivot] > list[left]
      left += 1
    else
      list[pivot], list[left] = list[left], list[pivot]
      pivot = left
    end
  end
  quick_sort(list, min, pivot -1) # Recursively sort the left portion of array
  quick_sort(list, pivot +1, max) # Recursively sort the right portion of array
end
