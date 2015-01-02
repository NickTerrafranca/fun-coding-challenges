def generate_pages(n)
  if n % 2 == 0 && n > 0
    first_page = 1
    last_page = n
    page_sequence = []
    (n/2).times do |i|
      page_sequence[i] = [first_page, last_page]
      first_page += 1
      last_page -= 1
    end
  else
    raise ArgumentError, 'Argument must be an even natural number'
  end
  page_sequence
end

p generate_pages(100)
