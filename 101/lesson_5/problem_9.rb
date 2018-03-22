# problem_9.rb

# Given this data structure, return a new array of the same structure but with
# the sub arrays being ordered (alphabetically or numerically as appropriate)
# in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

new_array =
arr.map do |subarray|
  subarray.sort { |i1, i2| i2 <=> i1 }
end

p arr
p new_array
