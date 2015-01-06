# Generates a book page number layout with both even and odd numbers
def generate_pages(n)
  first_page = 1
  last_page = (n - 1)
  remaining_page = n
  page_sequence = []

  if n % 2 == 1 && n > 0

    (n/2).times do |i|
      page_sequence[i] = [first_page, last_page]
      first_page += 1
      last_page -= 1
    end
    page_sequence.unshift([nil, remaining_page])

  elsif n % 2 == 0 && n > 0
    last_page = n

    (n/2).times do |i|
      page_sequence[i] = [first_page, last_page]
      first_page += 1
      last_page -= 1
    end
  end
  page_sequence
end

p generate_pages(25)
