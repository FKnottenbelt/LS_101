# odd_lists.rb

# Write a method that returns an Array that contains every other element
# of an Array that is passed in as an argument. The values in the returned
# list should be those values that are in the 1st, 3rd, 5th, and so on elements
# of the argument Array.

# Examples:

# oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# oddities(['abc', 'def']) == ['abc']
# oddities([123]) == [123]
# oddities([]) == []

# i: array
# o: array with odd index values from input array

def oddities(arr)
  arr.select { |i| arr.index(i).even?}
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

# Further Exploration
# Write a companion method that returns the 2nd, 4th, 6th, and
# so on elements of an array.
# Try to solve this exercise in at least 2 additional ways.

def eventies(arr)
  arr.select { |i| arr.index(i).odd?}
end

def eventies(arr)
  output = []
  arr.each.with_index do |value, i|
    i.odd? ? output.push(value) : next
  end
  output
end

def eventies(arr)
  arr.delete_if { |i| arr.index(i) % 2 == 1}
end

p eventies([2, 3, 4, 5, 6])
p eventies(['abc', 'def'])
p eventies([123])
p eventies([])
