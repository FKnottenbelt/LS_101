#  word_to_digit.rb

# Write a method that takes a sentence string as input, and returns the same string
# with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five',
# 'six', 'seven', 'eight', 'nine' converted to a string of digits.

=begin
i: sentence
o: string with number words converted to numbers
f: loop trough word. if word in lookup, use value
=end

def word_to_digit(sentence)
  numbers = { 'zero' => 0, 'one' => 1, 'two' => 2, 'three' => 3,
              'four' => 4, 'five' => 5 } # etc

  sentence.split.map do |word|
    clean_word = word.delete('^a-zA-Z')
    if numbers.include?(clean_word)
      word.gsub!(clean_word, numbers[clean_word].to_s)
    else
      word
    end
  end.join(' ')
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') #==
'Please call me at 5 5 5 1 2 3 4. Thanks.'

# ls student solution
def word_to_digits(sentence)
  conversions = {'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4', 'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9' }
   #search the string for values in the hash
  conversions.each {|x , v| sentence.gsub!(x,v) }
  sentence
end

=begin

Further Exploration

There are many ways to solve this problem and different varieties of it.
Suppose, for instance, that we also want to replace uppercase and capitalized
words.

Can you change your solution this so the spaces between consecutive numbers
are removed? Suppose the string already contains two or more space separated
numbers (not words); can you leave those spaces alone, while removing any
spaces between numbers that you create?

What about dealing with phone numbers? Is there any easy way to format the
result to account for phone numbers? For our purposes, assume that any 10
digit number is a phone number, and that the proper format should be
"(123) 456-7890".
=end
