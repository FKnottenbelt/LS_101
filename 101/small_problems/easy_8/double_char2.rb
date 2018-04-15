# double_char2.rb

# Write a method that takes a string, and returns a new string in which
# every consonant character is doubled. Vowels (a,e,i,o,u), digits,
# punctuation, and whitespace should not be doubled.

CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

def double_consonants(string)
  string.split('').map do |char|
    CONSONANTS.include?(char.downcase)? char * 2 : char
  end.join
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

# ls solution
CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

def double_consonants(string)
  result = ''
  string.each_char do |char|
    result << char
    result << char if CONSONANTS.include?(char.downcase)
  end
  result
end