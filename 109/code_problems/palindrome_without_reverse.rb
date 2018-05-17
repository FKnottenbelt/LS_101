# palindrome_without_reverse.rb

# write a method to determine if a word is a palindrome, without using the
# reverse method

# p palindrome?('hello') == false
# p palindrome?('madam') == true






















puts "############# solutions ###########"
def reverse_str(string)
  counter = string.size - 1
  output = ''
  loop do
    break if counter < 0
    output << string[counter]
    counter -= 1
  end
  output
end

def palindrome?(string)
  string == reverse_str(string)
end

p palindrome?('hello') == false
p palindrome?('madam') == true