# multiply.rb

# Continuing on with the idea of building generic methods, let's update
# our double_numbers method to not only be able to double the values in
# an array, but to multiply by any number. For example, let's create a
# method called multiply that can take an additional argument to determine
# the transformation criteria.

# Try coding a method that allows you to multiply every array item by a
# specified value

def multiply(numbers, multiply_by)
  multiplied_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    multiplied_numbers << current_number * multiply_by

    counter += 1
  end
  multiplied_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]
p my_numbers
