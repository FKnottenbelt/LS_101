# letter_counter2.rb

# Modify the word_sizes method from the previous exercise to exclude
# non-letters when determining word size. For instance, the length
# of "it's" is 3, not 4.

def word_sizes(sentence)
  output = {}
  sentence.gsub!(/[^a-zA-Z ]/,'')

  sentence.split(' ').each do |word|
    key = word.size
    value = output.key?(key) ? output[key] + 1 : 1
    output[key] = value
  end
  output
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}

# LS solution
def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    clean_word = word.delete('^A-Za-z')
    counts[clean_word.size] += 1
  end
  counts
end
