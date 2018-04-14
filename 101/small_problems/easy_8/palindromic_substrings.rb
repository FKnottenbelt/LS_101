# palindromic_substrings.rb

# Write a method that returns a list of all substrings of a string that are
# palindromic. That is, each substring must consist of the same sequence of
# characters forwards as it does backwards. The return value should be
# arranged in the same sequence as the substrings appear in the string.
# Duplicate palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous
# exercise.

# For the purposes of this exercise, you should consider all characters
# and pay attention to case; that is, "AbcbA" is a palindrome, but neither
# "Abcba" nor "Abc-bA" are. In addition, assume that single characters
# are not palindromes.

# f : - loop through substrings (made with previous method)
#     - for each substring see if equal to reverse. if so add to output.

def substrings_at_start(string)
  output = []
  counter = 0
  loop do
    break if counter == string.size
    substring = string[0..counter]
    output << substring
    counter += 1
  end
  output
end

def substrings(string)
  output = []
  counter = 0

  loop do
    break if counter == string.size
    current_string = string[counter..string.size]
    output << substrings_at_start(current_string)
    counter += 1
  end
  output.flatten
end

def palindromes(string)
  strings = substrings(string)
  strings.select do |substr|
    substr == substr.reverse && substr.size > 1
  end
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

# ls solution
def palindromes(string)
  all_substrings = substrings(string)
  results = []
  all_substrings.each do |substring|
    results << substring if palindrome?(substring)
  end
  results
end

def palindrome?(string)
  string == string.reverse && string.size > 1
end

# Further Exploration

# Can you modify this method (and/or its predecessors) to ignore
# non-alphanumeric characters and case?
