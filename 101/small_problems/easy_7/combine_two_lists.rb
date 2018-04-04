# combine_two_lists.rb

# Write a method that combines two Arrays passed in as arguments, and returns
# a new Array that contains all elements from both Array arguments, with the
# elements taken in alternation.

# You may assume that both input Arrays are non-empty, and that they have the
# same number of elements.

# f: take index element from array1 add to new
#   idem for array 2.
#   update index. repeat until index == array.size

def interleave(arr1, arr2)
  new_arr = []
  counter = 0
  loop do
    break if counter == arr1.size
    new_arr << arr1[counter]
    new_arr << arr2[counter]
    counter += 1
  end
  new_arr
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
