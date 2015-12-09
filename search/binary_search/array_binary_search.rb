def dinary_search(a, target)
  low = 0
  high = a.size - 1
  calc_mid = -> (lo, hi) { (lo + hi) / 2 }
  mid = calc_mid.call(low, high)
  while low <= high
    if low == high && a[mid] != target
      raise Exception.new("#{target} not found")
    elsif a[mid] == target
      return mid
    elsif target < a[mid]
      high = mid - 1
      mid = calc_mid.call(low, high)
    elsif a[mid] < target
      low = mid + 1
      mid = calc_mid.call(low, high)
    end
  end
end
