# double_number_inplace.rb

# the double_numbers method returned a new array with every element doubled,
# and that the original array is not mutated. In other words, my_numbers is
# still [1, 4, 3, 7, 2, 6]
# Can you implement a double_numbers! method that mutates its argument?
my_numbers = [1, 4, 3, 7, 2, 6]

def double_numbers!(numbers)
 counter = 0

  loop do
    break if counter == numbers.size

    numbers[counter] *= 2

    counter += 1
  end
  numbers
end

p my_numbers
p double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]
p my_numbers
