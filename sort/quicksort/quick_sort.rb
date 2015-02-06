require 'pry'
unsorted_array = [53, 0, 92, 37, 5, 45, 60, 89, 65, 66, 79, 21, 4, 52, 35, 18, 71, 17, 20, 2, 10, 67, 6, 99, 55, 46, 73, 58, 51, 94, 30, 69, 28, 83, 33, 13, 1, 44, 64, 48, 98, 62, 29, 23, 11, 14, 82, 97, 38, 70, 61, 32, 49, 68, 12, 25, 40, 22, 72, 80, 24, 59, 7, 54, 3, 88, 93, 95, 77, 8, 16, 84, 81, 91, 50, 96, 31, 9, 90, 78, 85, 34, 47, 75, 76, 87, 36, 26, 56, 63, 15, 41, 86, 43, 39, 57, 19, 74, 42, 27]

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

  # These variables preserve the initial start and end values for later recursive calls
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

  quick_sort(list, min, pivot -1) # Recursively sort the left portion of array
  quick_sort(list, pivot +1, max) # Recursively sort the right portion of array
end

p quick_sort(unsorted_array)
