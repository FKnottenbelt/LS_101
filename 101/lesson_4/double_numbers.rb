# double_numbers.rb

# the double_numbers method returned a new array with every element doubled,
# and that the original array is not mutated. In other words, my_numbers is
# still [1, 4, 3, 7, 2, 6]

def double_numbers(numbers)
 counter = 0
 output = []

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    output << current_number * 2

    counter += 1
  end
  output
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_numbers(my_numbers) # => [2, 8, 6, 14, 4, 12]