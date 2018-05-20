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