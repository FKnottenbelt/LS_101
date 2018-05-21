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

# problem_2

# How would you order this array of hashes based on the year of publication
# of each book, from the earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

# problem_5.rb

# Given this nested Hash:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# figure out the total age of just the male members of the family

# problem_6.rb

# One of the most frequently used real-world string properties is that of
# "string substitution", where we take a hard-coded string and modify it
# with various parameters from our program.

# Given this previously seen family hash, print out the name, age and gender
# of each family member:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# ...like this:

# (Name) is a (age)-year-old (male or female).

# problem_8.rb

# Using the each method, write some code to output all of the vowels from the
# strings

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'],
       fourth: ['over', 'the', 'lazy', 'dog']}

# problem_9.rb

# Given this data structure, return a new array of the same structure but with
# the sub arrays being ordered (alphabetically or numerically as appropriate)
# in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

#=> [["c", "b", "a"], [3, 2, 1], ["green", "blue", "black"]]

# problem_10.rb

# Given the following data structure and without modifying the original array,
# use the map method to return a new array identical in structure to the
# original but where the value of each integer is incremented by 1.

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
# => [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]

# problem_11.rb

# Given the following data structure use a combination of methods, including
# either the select or reject method, to return a new array identical in
# structure to the original but containing only the integers that are
# multiples of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
# => [[], [3], [9], [15]]

# problem_12.rb

# Given the following data structure, and without using the Array#to_h method,
# write some code that will return a hash where the key is the first item in
# each sub array and the value is the second item.

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

# => {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

# problem_13.rb

# Given the following data structure, return a new array containing the same
# sub-arrays as the original but ordered logically according to the numeric
# value of the odd integers they contain.

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

# The sorted array should look like this:

# [[1, 8, 3], [1, 6, 7], [1, 4, 9]]
