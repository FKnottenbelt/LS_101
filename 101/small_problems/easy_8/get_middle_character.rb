# get_middle_character.rb

# Write a method that takes a non-empty string argument, and returns the middle
# character or characters of the argument. If the argument has an odd length,
# you should return exactly one character. If the argument has an even length,
# you should return exactly two characters.

# i: string
# o: middle chars(s) odd 1 even 2 in string
# f: get string length
#   determine odd/even
#   if odd: length / 2, = index to return
#     if even: length /2 = index to return plus one before

def center_of(string)
  len = string.size
  index = len / 2
  len.odd? ? string[index] : string[(index - 1)..index]
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
