# searching_101.rb

# Write a program that solicits 6 numbers from the user, then prints a message
# that describes whether or not the 6th number appears amongst the first
# 5 numbers.

# input(25,15,20,17,23,17) # => The number 17 appears in [25, 15, 20, 17, 23]
# input(25,15,20,17,23,18) # => The number 18 does not appear
#                         #    in [25, 15, 20, 17, 23].

# i: 6 integers
# o: message
# d: array
# f: - collect 6 numbers from user and store in array
#   - pop the last number and see whether it is included in de array
#   - write one of 2 messages

input = []
loop do
  puts "please give me a number"
  number = gets.to_i
  input.push(number)
  break if input.size == 6
end

last = input.pop
if input.include?(last)
  puts "Then number #{last} appears in #{input}"
else
  puts "Then number #{last} does not appears in #{input}"
end
