# Write a method that takes one argument, a string containing one or more 
# words, and returns the given string with all five or more letter words reversed. 
# Each string will consist of only letters and spaces. Spaces should be included 
# only when more than one word is present.

# Examples:

# puts reverse_words('Professional')          # => lanoisseforP
# puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
# puts reverse_words('Launch School')         # => hcnuaL loohcS

#############
# i: string with one or more words
# o: a string with the letters in all words.size >= 5 reversed while all
# smaller words stay untouched
# d: array to get at the words, string to count and reverse the words themselves
# f: - turn string into array
# - loop through the array and 
#   - turn each word into a string
#   - if the string size is >=5 
#     - reverse the string back into the array element
#     - else: keep the array element
#   - join the array with a spaces
  
def reverse_words string
  string.split.each{|w| w.size >= 5 ? w.reverse! : w }.join(' ')
end


puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS