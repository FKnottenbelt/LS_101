# does_my_list_include_this.rb

# Write a method named include? that takes an Array and a search value as
# arguments. This method should return true if the search value is in the
# array, false if it is not. You may not use the Array#include? method in
# your solution.

def include?(list, item)
  result = list.select { |value| value == item }
  !result.empty?
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

# LS solution
def include?(array, value)
  !!array.find_index(value)
end

# find_index returns the index number of the found element, which will always
# have a truthy value, or nil if no such element is present. We then use !! to
# force the return value to true or false in accordance with the implied promise
# of the ? in include?.