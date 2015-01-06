# Generates a book page number layout with an even number of pages starting with the 'centerfold' page rather that the first/last page
def generate_pages(n)
  if n % 2 == 0 && n > 0
    lef_page = (n/2)
    right_page = (n/2) + 1
    page_sequence = []
    (n/2).times do |i|
      page_sequence[i] = [lef_page, right_page]
      lef_page -= 1
      right_page += 1
    end
  else
    raise ArgumentError, 'Argument must be an even natural number'
  end
  page_sequence
end

p generate_pages(10)
