# Write a method that takes one argument, a string, and returns the same 
# string with the words in reverse order.

# Examples:

# puts reverse_sentence('') == ''
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'

# The tests above should print true.

##########
# i: string with words
# o: string with words in reverse order
# d: array
# f: - split string into array of words
#   - reverse the array
#   - join the array with a space

def reverse_sentence string
  string.split.reverse.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
