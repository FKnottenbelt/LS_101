# sum_or_product.rb

# Write a program that asks the user to enter an integer greater than 0, then
# asks if the user wants to determine the sum or product of all numbers between
# 1 and the entered integer.

# Examples:

# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.

# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.

int = 0
loop do
  puts ">> Please enter an integer greater than 0:"
  int = gets.to_i
  break if Integer(int) > 0
  puts "not a ingteger greater than 0"
end

action = ''
loop do
  puts " >> Enter 's' to compute the sum, 'p' to compute the product"
  action = gets.chomp.downcase
  break if action == 's' || action == 'p'
  puts "enter s or p"
end

case action
when 's'
  result = (1..int).inject(:+)
  puts "The sum of the integers between 1 and #{int} is #{result}"
when 'p'
  result = (1..int).inject(:*)
  puts "The product of the integers between 1 and #{int} is #{result}"
end
