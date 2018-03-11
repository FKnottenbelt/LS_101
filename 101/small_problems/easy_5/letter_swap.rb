# letter_swap.rb

# Given a string of words separated by spaces, write a method that takes thi
# string of words and returns a string in which the first and last letters of
# every word is swapped.

# You may assume that every word contains at least one letter, and that the
# string will always contain at least one word. You may also assume that each
# string contains nothing but words and spaces

# i: string of words. Case sensitive
# o: string of words with first and last letter of every word swapped
# f: we have a collection, and transformation
#   - we need to transform per word, so let's make an array of words
#   - than loop trough the collection and transform => array.map
#   - swap the first and the last letters. make sure the whole word i
#     returned
#   - at the end join with spaces the output array

def swap(sentence)
  sentence.split(' ').map do |word|
    word[0], word[-1] = word[-1], word[0]
    word
  end.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
