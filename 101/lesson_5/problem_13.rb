# problem_13.rb

# Given the following data structure, return a new array containing the same
# sub-arrays as the original but ordered logically according to the numeric
# value of the odd integers they contain.

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

# The sorted array should look like this:

# [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

output =
arr.sort do |sub_array, b|
  sub_array.map { |int| int if int.odd?}
  b <=> sub_array
end

p output

# LS solution
arr.sort_by do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end
end