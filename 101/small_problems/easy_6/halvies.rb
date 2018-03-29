# halvies.rb

# Write a method that takes an Array as an argument, and returns two Arrays
# that contain the first half and second half of the original Array,
# respectively. If the original array contains an odd number of elements,
# the middle element should be placed in the first half Array.

# f: - find half (size / 2)
#   - if odd half + 1 for first section
#   - if size is 0 : twice []
#   - if size is 1 rest is 0 => []

def halvsies(arr)
  arr.size.even? ? half = ((arr.size / 2) -1 ) : half = (arr.size / 2)
  arr.partition { |num| arr.index(num) <= half }
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]


# nicer version from ls student:
def halvsies(arr)
    arr.partition { |elem| arr.index(elem) <= (arr.size - 1) / 2 }
end

# ls solution
def halvsies(array)
  first_half = array.slice(0, (array.size / 2.0).ceil)
  second_half = array.slice(first_half.size, array.size - first_half.size)
  [first_half, second_half]
end
