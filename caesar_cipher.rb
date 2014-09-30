string = "may a moody baby doom a yam"

def to_caesar_ciph(string, offset)
  key = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
  string = string.downcase
  string = string.split('')
  cipher = ""

  if offset <= 25
    string.each do |e|
      if e == " "
        cipher << " "
      else
        n = key.index(e) + offset
        if n > key.length
          n = key.index(e) + (offset - key.length)
        end
        # binding.pry
        cipher << key[n]
      end
    end

  else
    return "please enter an offset of 25 or less"
  end
  cipher
end

puts to_caesar_ciph(string, 3)
