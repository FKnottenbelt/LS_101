# rotation_part1.rb

# Write a method that rotates an array by moving the first element to the end
# of the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

# i: array of elements
# o: same but first element is now last. non mutating
# f: take and save first element
#   copy rest
#   add first element

def rotate_array(arr)
  output = []
  first = arr.first
  output = arr[1..(arr.length + 1)]
  output << first
end

def rotate_array(arr)
  arr_new = arr.dup
  first = arr_new.shift
  arr_new << first
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

# ls solution
def rotate_array(array)
  array[1..-1] + [array[0]]
end

# Further Exploration

# Write a method that rotates a string instead of an array. Do the same thing
# for integers. You may use rotate_array from inside your new method.

def rotate_string(string)
  string.split('').rotate.join
end

p rotate_string("hello") == "elloh"

def rotate_integer(int)
  int.digits.reverse.rotate.join.to_i
end

p rotate_integer(1234) == 2341
