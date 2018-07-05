=begin
Write a function that takes in a string of one or more words,
and returns the same string, but with all five or more letter
words reversed. Strings passed in will consist of only letters
and spaces. Spaces will be included onlywhen more than one
word is present.
=end

p spinWords("Hey fellow warriors") == "Hey wollef sroirraw"
p spinWords("This is a test") == "This is a test"
p spinWords("This is another test") == "This is rehtona test"




















####################3
# i: sentence
# o: string with words of more than 5 letters reversed
# f: split into words
#     loop trough words
#   - if size of word is >= 5 then reverse word
#       and add to output
#       - otherwise just add to output

def spinWords(sentence)
  sentence.split().map do |word|
    word.size >= 5 ? word.reverse! : word
  end.join(' ')
end



