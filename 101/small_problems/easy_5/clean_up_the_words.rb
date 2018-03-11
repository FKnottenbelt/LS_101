# clean_up_the_words.rb

# Given a string that consists of some words and an assortment of
# non-alphabetic characters, write a method that returns that string with
# all of the non-alphabetic characters replaced by spaces. If one or more
# non-alphabetic characters occur in a row, you should only have one space
# in the result (the result should never have consecutive spaces).

# i: string with letters and other stuff
# o: string with other stuff replaced by spaces and spaces squeezed
# f: - replace what is not a letter with space
#     - split into array
#     - loop through collection and transform
#     - if the letter is not in between a..z then replace by space
#     - join back into string
#   - squeeze the spaces out.
# a: no captial letters, no numbers

def cleanup(scentence)
  scentence.chars.map do |char|
    if char.between?('a', 'z')
      char
    else
      ' '
    end
  end.join('').squeeze(' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '

# ls solution
def cleanup(text)
  text.gsub(/[^a-z]/i, ' ').squeeze(' ')
end