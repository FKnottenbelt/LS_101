# write a programm that ask the user to return an integer > 0, than ask if the
# user wants to determine the sum or the product of all numbers between 1 and the
# entered integer.

puts "Please enter integer > 0"
int = gets.chomp.to_i

puts "do you want sum or product"
action = gets.chomp

arr = (1..int).to_a

if action == 'sum'
  puts "the sum is #{arr.sum}"
elsif action == "product"
  product = arr.inject(:*)
  puts "the product is #{product}"
end