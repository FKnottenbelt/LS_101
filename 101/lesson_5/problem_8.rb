# problem_8.rb

# Using the each method, write some code to output all of the vowels from the
# strings

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'],
       fourth: ['over', 'the', 'lazy', 'dog']}

# option 1
VOWELS = ['a','e','i','o','u']

hsh.each_value do |words|
  words.join().chars { |l| puts l if VOWELS.include?(l)}
end

# option 2
hsh.each_value do |words_array|
  words_array.each do |words|
    words.each_char do |char|
      print char if VOWELS.include?(char)
    end
  end
end

# ls solution
vowels = 'aeiou'

hsh.each do |_, value|
  value.each do |str|
    str.chars.each do |char|
      puts char if vowels.include?(char)
    end
  end
end
