def quick_sort(list, start_point = nil, end_point = nil)
  if list == []
    return []
  end

  if start_point && end_point
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

  min = left
  max = right

  while left < right

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
  quick_sort(list, min, pivot -1)
  quick_sort(list, pivot +1, max)
end
