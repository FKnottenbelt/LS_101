# palindromic_strings_1.rb

# Write a method that returns true if the string passed as an argument is a
# palindrome, false otherwise. A palindrome reads the same forward and
# backward. For this exercise, case matters as does punctuation and spaces.

# Examples:

# palindrome?('madam') == true
# palindrome?('Madam') == false          # (case matters)
# palindrome?("madam i'm adam") == false # (all characters matter)
# palindrome?('356653') == true

# i: string
# o: true if palindrome, false if not
# r: case matters, space and punctuation too
# f: - string  == string in reverse

def palindrome?(string)
  string == string.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true
puts '--------------------'

# Further Exploration
# - Write a method that determines whether an array is palindromic; that is,
# the element values appear in the same sequence both forwards and backwards
# in the array.

def a_palindrome?(array)
  array == array.reverse
end

p a_palindrome?(['Madam']) == true
p a_palindrome?(['madam ',"i'm"," adam"]) == false
puts '--------------------'

# - Now write a method that determines whether an array or a
# string is palindromic; that is, write a method that can take either an
# array or a string argument, and determines whether that argument is a
# palindrome. You may not use an if, unless, or case statement or modifier

def super_palindrome?(arg)
  arg == arg.reverse
end
p super_palindrome?("madam i'm adam") == false # (all characters matter)
p super_palindrome?('356653') == true
p super_palindrome?(['Madam']) == true
p super_palindrome?(['madam ',"i'm"," adam"]) == false