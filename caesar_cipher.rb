string = "may a moody baby doom a yam"

def to_caesar_ciph(string, offset)
  string = string.downcase
  KEY = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
  cipher = ""
  if offset > 26
    string.each_char do |e|
      n = KEY.index(e) + offset
      cipher << KEY[n]
    end
  end
  cipher
end

to_caesar_ciph(string, 3)

    # find index num of e in ALPH, add n to it. get string at that index and put it in cipher
