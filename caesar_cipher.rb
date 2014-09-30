def to_caesar_ciph(string, offset)
  raise ArgumentError, 'Argument must be less than 26' unless offset < 26
  key = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
  string = string.downcase
  cipher = ''
  string.each_char do |e|
    if e == ' '
      cipher.concat(' ')
    else
      n = key.index(e) + offset
      if n >= 25
        n = key.index(e) + (offset - 26)
      end
      cipher.concat(key[n])
    end
  end
  cipher
end
