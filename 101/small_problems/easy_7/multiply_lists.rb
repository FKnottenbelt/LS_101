# multiply_lists.rb

# Multiply Lists

# Write a method that takes two Array arguments in which each
# Array contains a list of numbers, and returns a new Array that
# contains the product of each pair of numbers from the arguments
# that have the same index. You may assume that the arguments
# contain the same number of elements.

# i: 2 arrays with numbers
# o: new array with
#   products:  arr1[0] * arr2[0]
#             arr1[1] * arr2[1] etc
# f: either simple loop or a map
#   for each index multiply and write to output

def multiply_list(arr1, arr2)
  output = []
  counter = 0
  loop do
    break if counter == arr1.size
    output << arr1[counter] * arr2[counter]
    counter += 1
  end
  output
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# Further exploration

# The Array#zip method can be used to produce an extremely
# compact solution to this method. Read the documentation
# for zip, and see if you can come up with a one line solution
# (not counting the def and end lines).

# arr1.zip(arr2) will give: [[3, 9], [5, 10], [7, 11]]

def multiply_list2(arr1, arr2)
  arr1.zip(arr2).map { |subarr| subarr.inject(:*) }
end

p multiply_list2([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
