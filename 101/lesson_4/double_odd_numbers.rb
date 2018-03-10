# double_odd_numbers.rb

# What if we wanted to transform the numbers based on their position in the
# array rather than their value? Try coding a solution that doubles the numbers
# that have odd indices

my_numbers = [1, 4, 3, 7, 2, 6]

def double_odd_numbers(numbers)
 counter = 0
 double_odd_numbers = []

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    double_odd_numbers << current_number

    counter += 1
  end
  double_odd_numbers
end

p my_numbers
p double_odd_numbers(my_numbers) # => [1, 8, 3, 14, 2, 12]
p my_numbers