# multipying_2_nums.rb

# Create a method that takes two arguments, multiplies them together, and
# returns the result.

# Example:
# multiply(5, 3) == 15

def multiply(num1, num2)
  num1 * num2
end

p multiply(5, 3) == 15
p multiply(5, 0) == 0
# p multiply(5) # error
# p multiply()  # error
p multiply([1, 2], 3) == [1, 2, 1, 2, 1, 2]
