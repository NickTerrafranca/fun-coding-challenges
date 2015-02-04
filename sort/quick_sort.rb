require 'pry'
unsorted_array = [27, 77, 29, 43, 80, 96, 70, 94, 99, 82, 52, 41, 35, 57, 58, 86, 79, 90, 65, 46, 85, 97, 23, 59, 11, 15, 60, 88, 2, 63, 7, 54, 25, 47, 18, 26, 45, 36, 64, 56, 14, 69, 10, 37, 38, 3, 98, 20, 16, 5, 6, 21, 76, 81, 93, 0, 30, 33, 17, 61, 32, 87, 67, 55, 28, 92, 24, 31, 72, 34, 13, 62, 53, 8, 44, 48, 9, 12, 71, 75, 78, 66, 42, 4, 19, 68, 84, 1, 83, 74, 39, 40, 22, 49, 50, 73, 95, 51, 91, 89]

def quick_sort(list = nil, start_point = nil, end_point = nil)

  if start_point
    left = start_point
    pivot = left
  else
    left = list[0]
    pivot = left
  end

  if end_point
    right = end_point
  else
    right = list[-1]
  end

  binding.pry

  unless left == right
    if pivot < right
      right = right -=1
    else
      list[pivot] = right
      list[right] = pivot
      pivot = right
      if pivot > left
        left = left += 1
      else
        list[pivot] = left
        list[left] = pivot
        pivot = left
      end
    end
  end

  list
  # binding.pry
end

p quick_sort(unsorted_array)
