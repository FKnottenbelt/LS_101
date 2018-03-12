# additional_practice.rb

# lesson 4 Additional practice
####################
# problem 1

# Turn this array into a hash where the names are the keys and the values are
# the positions in the array.
# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# A:
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

hash = {}
flintstones.each_with_index do |name, index|
  hash[name] = index
end
p hash

#############
# Practice Problem 2

# Add up all of the ages from the Munster family hash:
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
# "Marilyn" => 22, "Spot" => 237 }

# A:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
"Marilyn" => 22, "Spot" => 237 }

sum = 0
ages.each do |_,v|
  sum += v
end
p sum

# A2:
p ages.values.inject(:+)

# This uses ages.values to make an array, then uses the inject method which
# is part of the Enumerable module.

#############
# Practice Problem 3

# In the age hash:
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# throw out the really old people (age 100 or older).

# A:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.delete_if { |_, value| value > 100 }
p ages

# LS A:
ages.keep_if { |_, age| age < 100 }

####################
# Practice Problem 4

# Pick out the minimum age from our current Munster family hash:
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
# "Marilyn" => 22, "Spot" => 237 }

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
"Marilyn" => 22, "Spot" => 237 }

p ages.values.min

####################
# Practice Problem 5

# In the array:
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# Find the index of the first name that starts with "Be"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.select { |name| name.start_with?('Be') }

# LS A:
flintstones.index { |name| name[0, 2] == "Be" }

####################
# Practice Problem 6

# Amend this array so that the names are all shortened to just the first
# three characters:
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.map { |name| name[0,3] }

# nb: use map! if you want to change the original

####################
# Practice Problem 7

# Create a hash that expresses the frequency with which each letter occurs
# in this string:
# statement = "The Flintstones Rock"
# ex:
# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

statement = "The Flintstones Rock"

output = Hash.new{0}
statement.delete!(' ')

statement.chars.each do |letter|
  output[letter] += 1
end
p output

# alternative with simple loop
statement = "The Flintstones Rock"

statement.delete!(' ')
output = Hash.new{0}
counter = 0

loop do
  break if counter == statement.size
  current_letter = statement[counter]
  output[current_letter] += 1

  counter +=1
end
p output

# LS solution
statement = "The Flintstones Rock"

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end

p result

####################
# Practice Problem 8

# What happens when we modify an array while we are iterating over it?
# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
p numbers

# a:
# output:
# 1
# 3
# [3, 4]
p '----------'
# numbers.shift(1) has the same effect als .shift
# but .schift(2) will shift the first 2 items..

# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
p numbers

# A:
# 1
# 2
# [1, 2]

p '----------'
# To better understand what is happening here, we augment our loop with
# some additional "debugging" information:

numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
  p "#{index}  #{numbers.inspect}  #{number}"
  numbers.shift(1)
end

# The output is:

# "0  [1, 2, 3, 4]  1"
# "1  [2, 3, 4]  3"

# From this we see that our array is being changed as we go (shortened and
# shifted), and the loop counter used by #each is compared against the
# current length of the array rather than its original length.

# In our first example, the removal of the first item in the first pass
# changes the value found for the second pass.

# In our second example, we are shortening the array each pass just as in
# the first example...but the items removed are beyond the point we are
# sampling from in the abbreviated loop.

# In both cases we see that iterators DO NOT work on a copy of the original
# array or from stale meta-data (length) about the array. They operate on the
# original array in real time.

####################
# Practice Problem 9

# As we have seen previously we can use some built-in string methods to
# change the case of a string. A notably missing method is something provided
# in Rails, but not in Ruby itself...titleize. This method in Ruby on Rails
# creates a string that has each word capitalized as it would be in a title.
# For example, the string:

# words = "the flintstones rock"
# would be:
# words = "The Flintstones Rock"
# Write your own version of the rails titleize implementation.

# A: simple loop:
words = "the flintstones rock"

def titeleize(string)
  words = string.split(' ')
  counter = 0

  loop do
    break if counter == words.size
    words[counter] = words[counter].capitalize!

    counter += 1
  end
  words.join(" ")
end

p titeleize(words)

# version with map
words = "the flintstones rock"

def titeleize(string)
  string.split(' ').map do |word|
    word.capitalize!
  end.join(' ')
end

p titeleize(words)

# LS solution
words.split.map { |word| word.capitalize }.join(' ')

####################
# Practice Problem 10

# Given the munsters hash below
# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }
# Modify the hash such that each member of the Munster family has an
# additional "age_group" key that has one of three values describing the age
# group the family member is in (kid, adult, or senior). Your solution should
# produce the hash below

# { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
#   "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
#   "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
#   "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
#   "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64
# and a senior is aged 65+.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# simple loop solution
keys = munsters.keys
counter = 0

loop do
  break if counter == keys.size

  current_key = keys[counter]

  age_group = if munsters[current_key]["age"].between?(0, 17)
                 'kid'
              elsif munsters[current_key]["age"].between?(18, 64)
                 'adult'
              else
                 'senior'
              end

  munsters[current_key]['age_group'] = age_group

  counter += 1
end

p munsters
puts '--------------'

# solution with each. NB you do not want a .map here. That would give the
# last thing, so you would just get the age groups. I guess you could work
# around that, but .each is easier.
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, data|
  age_group = if data["age"].between?(0, 17)
                 'kid'
              elsif data["age"].between?(18, 64)
                 'adult'
              else
                 'senior'
              end
  data['age_group'] = age_group
end

p munsters

# ls solution
munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end
