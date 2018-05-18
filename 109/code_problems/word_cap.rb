# Write a method that takes a single string argument and returns a new string
# that contains the original value of the argument, but the first letter of
# every word is now capitalized.

=begin
i: sentence
o: sentence with every word capitalized
f: split sentence into words
   capitalize words => transform, use map
   join together
=end

def word_cap(sentence)
  p sentence.split().map { |word| word.capitalize }.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap("four score 'and' seven") == "Four Score 'and' Seven"
