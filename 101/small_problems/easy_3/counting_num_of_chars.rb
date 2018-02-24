# counting_num_of_chars.rb

# Write a program that will ask a user for an input of a word or multiple words
# and give back the number of characters. Spaces should not be counted as
# a character.

# input:
# Please write word or multiple words: walk

# output:
# There are 4 characters in "walk".

# input:
# Please write word or multiple words: walk, don't run

# output:
# There are 13 characters in "walk, don't run".

# i: string with one or more words
# o: number of characters in string (exclusief spaces)
# f: - get input
#   - split into words
#   - join without spaces
#   - ask string size
#   - output

input = ''
loop do
  puts "Please write word or multiple words:"
  input = gets.chomp
  break if !input.empty?
  puts "Please write at least one word"
end

characters = input.split.join().size
puts "There are #{characters} characters in \"#{input}\"."
