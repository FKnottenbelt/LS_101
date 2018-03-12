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