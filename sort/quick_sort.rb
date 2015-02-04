require 'pry'
unsorted_array = [77, 29, 43, 80, 96, 70, 27, 94, 99, 82]

def quick_sort(list = nil, start_point = nil, end_point = nil)

  if start_point
    left = start_point
    pivot = left
  else
    left = 0
    pivot = left
  end

  if end_point
    right = end_point
  else
    right = list.index(list[-1])
  end
  # binding.pry
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
  list
  binding.pry
end

p quick_sort(unsorted_array)


# if list[pivot] > list[left]
#   left += 1
# else
#   p = list[pivot]
#   l = list[left]
#   list[p] = list[l]
#   list[l] = list[p]
#   pivot = left
# end


# if list[pivot] > list[left]
    #   left += 1
    # else
    #   p = list[pivot]
    #   l = list[left]
    #   list[p] = list[l]
    #   list[l] = list[p]
    #   pivot = left
    #   if list[pivot] < list[right]
    #     right -= 1
    #   else
    #     p = list[pivot]
    #     r = list[right]
    #     list[p] = list[r]
    #     list[r] = list[p]
    #     pivot = right
    #   end
    # end
