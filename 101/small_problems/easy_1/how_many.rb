# How Many

# Write a method that counts the number of occurrences of each element in a given array.

# vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle'
# , 'car', 'truck']

# count_occurrences(vehicles)

# Once counted, print each element alongside the number of occurrences.

# Expected output:

# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

####
# input: array with strings that have doubles
# output: list value and number of occurrences
# datatype: array
# flow:
#   - make a singles array with unique vehicles
#   - for each single print the singel and a count that single in the vehicles

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle',
  'car', 'truck']
 
def count_occurrences(vehicles)
  vehicles.uniq.each {|v| puts "#{v} => #{vehicles.count(v)}"}
end
  
count_occurrences(vehicles)
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

########### hash version
def count_occurrences(array)
  occurrences = {}

  array.each do |element|
    occurrences[element] = array.count(element)
  end

  occurrences.each do |element, count|
    puts "#{element} => #{count}"
  end
end