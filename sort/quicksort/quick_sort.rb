def quick_sort(list, start_point = nil, end_point = nil)
  if list == [] # Return an empty array if an empty array is passed
    return list
  end

  if start_point && end_point # This enables the initial call to quick_sort to require only the array as an argument
    if start_point >= end_point
      return list
    end
    left = start_point
    right = end_point
    pivot = start_point
  else # In the initial call, left points to the left most element, right to the right most element and pivot is the same as left
    left = 0
    right = list.size - 1
    pivot = left
  end

  min = left # These variables preserve the initial start and end values for later recursive calls
  max = right

  while left < right # The magic starts here
    if pivot == left # Start form the left
      if list[pivot] <= list[right] # If the pivot is less than or equal to the right variable, move right to the left by one
        right -= 1
      else # Otherwise if pivot is greater than right, swap pivot with right and point pivot to the right variable
        list[pivot], list[right] = list[right], list[pivot]
        pivot = right
      end
    elsif pivot == right
      if list[pivot] >= list[left] # If the pivot is greater than or equal to the left variable, move the left variable to the right by one
        left += 1
      else # Otherwise if pivot is less than left, swap pivot with left and point pivot to the left variable
        list[pivot], list[left] = list[left], list[pivot]
        pivot = left
      end
    end
  end
  quick_sort(list, min, pivot -1) # Recursively sort the left portion of array
  quick_sort(list, pivot +1, max) # Recursively sort the right portion of array
end
