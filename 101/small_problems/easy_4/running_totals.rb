# running_totals.rb

# Write a method that takes an Array of numbers, and returns an Array with the
# same number of elements, and each element has the running total from the
# original Array.

# i: array of numbers
# o: array with runnint total
# f: - loop trough the input array
#       - add the value to the running total
#       - concat new value to output array
#       - if emtpy input array return straight away

def running_total(input)
  output = []
  total = 0
  input.each do |value|
    total += value
    output << total
  end
  output
end


p running_total([2, 5, 13]) #== [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

# way better solution:
def running_total(array)
  sum = 0
  array.map { |value| sum += value }
end

def running_total(arr)
  arr.map.with_index { |num, idx| arr[0..idx].inject(:+) }
end

# with Array#each_with_object
def running_total(arr)
  total = 0
  arr.each_with_object([]) do |num, new_arr|
    new_arr << (total += num)
  end
end