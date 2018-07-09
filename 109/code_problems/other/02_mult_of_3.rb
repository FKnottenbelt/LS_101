###############
# hard question (harder than interview. Can do this in time, you're ready)

# Given an array of numbers find if any 3 numbers inside of the array
#   can be multiplied to get the maximum number in the array.
#   If the number is used once it can't be used again. If there are two same
# numbers then that number can be used 2 times.

# p mult_of_three_nums([1,2,3,4,5,6]) == true
# p mult_of_three_nums([3, 8, 0, 9, 4, 2, 7]) == false
# p mult_of_three_nums([5, 3, 7, 9, 2, 51, 90]) == true
# p mult_of_three_nums([1, 1, 5, 7, 987, 3, 2]) == true
# p mult_of_three_nums([2, 5, 8, 11, 32, 2]) == true
# p mult_of_three_nums([13, 3, 11, 56, 79, 2]) == false

















puts "######### solution ############"
=begin
i: array of integers
o: boolean: can 3 of the numbers be multiplied to get max number?
f: - find max number
   - need to multiply all numbers with all other numbers.
    - so basically a sub array over 3 layers
      - see if the middle layer product = max num
      - if so: break
=end

def mult_of_three_nums(arr)
  max_num = arr.max
  (0...(arr.size - 2)).each do |level1|
    ((level1 + 1)...(arr.size - 1)).each do |level2|
      ((level2 + 1)...arr.size).each do |level3|
        product = arr[level1] * arr[level2] * arr[level3]
        return true if product == max_num
      end
    end
  end
  false
end

p mult_of_three_nums([1,2,3,4,5,6]) == true
p mult_of_three_nums([3, 8, 0, 9, 4, 2, 7]) == false
p mult_of_three_nums([5, 3, 7, 9, 2, 51, 90]) == true
p mult_of_three_nums([1, 1, 5, 7, 987, 3, 2]) == true
p mult_of_three_nums([2, 5, 8, 11, 32, 2]) == true
p mult_of_three_nums([13, 3, 11, 56, 79, 2]) == false
