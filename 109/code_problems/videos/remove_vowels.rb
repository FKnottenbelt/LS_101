# Write a method that takes an array of strings and returns an array of
# the same string values, except with the vowels removed

=begin
option 1
i array of strings
o: array of strings minus vowels
f: define VOWELS
   loop trough array to get at words
   for each letter: if included in vowels, don't add to output,
   otherwise do
=end

VOWELS = %w( a e o i u)

def remove_vowels(arr)
  arr.map do |words|
    words.each_char.map do |char|
      VOWELS.include?(char) ? char = "" : char
    end.join
  end
end

p remove_vowels(['yellow', 'green', 'black']) #== ['yllw', 'grn', 'blck']

=begin
option 2
f: join array to string sencentce
   use delete to delete all vowels
   split back to array
=end
def remove_vowels2(arr)
  sentence = arr.join(' ')
  sentence.delete!('aeoiu')
  sentence.split
end

puts '==option 2=='
p remove_vowels2(['yellow', 'green', 'black']) #== ['yllw', 'grn', 'blck']

# alternative
def remove_vowels(arr)
  arr.map do |word|
    word.gsub(/[aeiou]/,"")
  end
end
