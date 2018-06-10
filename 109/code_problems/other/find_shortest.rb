# Given a string of words, return the length of the shortest word(s).

puts find_short("bitcoin take over the world maybe who knows perhaps") == 3
puts find_short("turns out random test cases are easier than writing out basic ones") == 3
puts find_short("lets talk about javascript the best language") == 3
puts find_short("i want to travel the world writing code one day") == 1
puts find_short("Lets all go on holiday somewhere very cold") == 2






















#################
=begin
i: sentence
o: int (length of shortest word)
f: make into array of words
   sort array by word length
   first
=end

def find_short(sentence)
  sentence.split.sort_by { |word| word.length }.first.size
end