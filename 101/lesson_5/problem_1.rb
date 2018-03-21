# problem_1
# The purpose of these practice problems is to let you practice the specific
# concepts covered in the last three assignments; in some cases there may
# exist a Ruby method that lets you achieve the same result as passing a block
# to an iterative method but that isn't the objective here. Feel free to
# research those methods if you wish but you should try and solve the problems
# using the concepts and techniques outlined in the previous
# assignments. (so: sort (<=>), sort_by and nested collections)

# How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

arr.sort! { |n1, n2| n2.to_i <=> n1.to_i }

p arr
