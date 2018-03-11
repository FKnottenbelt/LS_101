# letter_counter.rb

# Write a method that takes a string with one or more space separated words
# and returns a hash that shows the number of words of different sizes.

# Words consist of any string of characters that do not include a space.

# i: string of words
# o: hash with as key number of letters, and as value how many words fit
#    the bill
# r: - empty input gives empty hash
#    - leestekens count as part of words
# f: - make a collection of words
#    - loop through collection and build up hash
#    - for each word count the number of characters for the key
#       - add to hash and add 1 to the value
#    - output hash

def word_sizes(sentence)
  output = {}
  sentence.split(' ').each do |word|
    key = word.size
    value = output.key?(key) ? output[key] + 1 : 1
    output[key] = value
  end
  output
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

# LS solution
def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    counts[word.size] += 1
  end
  counts
end
