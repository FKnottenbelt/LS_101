# sum_of_sums.rb

# Sum of Sums

# Write a method that takes an Array of numbers and then returns the sum of
# the sums of each leading subsequence for that Array. You may assume that
# the Array always contains at least one number.

# i array of numbers
# o sum of running total
# f: loop through array
#   make running total and write to new array
#   sum all values in new array

def sum_of_sums(arr)
  arr.map.with_index { |num, index| arr[0..index].sum}.sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35

# LS solution:
def sum_of_sums(numbers)
  sum_total = 0
  1.upto(numbers.size) do |count|
    sum_total += numbers.slice(0, count).reduce(:+)
  end
  sum_total
end
