def quick_sort(list, start_point = nil, end_point = nil)
  if list == [] # Return an empty array if an empty array is passed
    return []
  end

  if start_point && end_point # This enables the initial call to quick_sort to require only the array as an argument
    if start_point >= end_point
      return list
    end
    left = start_point
    right = end_point
    pivot = start_point
  else
    left = 0
    right = list.count - 1
    pivot = 0
  end

  min = left # These variables preserve the initial start and end values for later recursive calls
  max = right

  while left < right # The magic happens here
    if pivot == left
      if list[pivot] <= list[right]
        right -= 1
      else
        list[pivot], list[right] = list[right], list[pivot]
        pivot = right
      end
    elsif pivot == right
      if list[pivot] >= list[left]
        left += 1
      else
        list[pivot], list[left] = list[left], list[pivot]
        pivot = left
      end
    else
      raise "Inconsistent state"
    end
  end
  quick_sort(list, min, pivot -1) # Recursively sort the left portion of array
  quick_sort(list, pivot +1, max) # Recursively sort the right portion of array
end
