# rotation_part3.rb

# If you take a number like 735291, and rotate it to the left, you get 352917.
# If you now keep the first digit fixed in place, and rotate the remaining digits,
# you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759.
# Keep the first 3 digits fixed in place and rotate again to get 321597. Finally,
# keep the first 4 digits fixed in place and rotate the final 2 digits to get
# 321579. The resulting number is called the maximum rotation of the original number.

# Write a method that takes an integer as argument, and returns the maximum
# rotation of that argument. You can (and probably should) use the
# rotate_rightmost_digits method from the previous exercise.
# 735291 rotate 6
# 3 52917 rotate right most 5
# 32 9175 rotate right most 4
# 321 759 rotate right most 3
# 321 597 rotate right most 2
# 3215 79 max rotation

def rotate_rightmost_digits(number, offset)
  arr = number.digits.reverse
  move_num = arr.slice!(-offset)
  arr << [move_num]
  arr.join.to_i
end
=begin
i: integer
o: max rotation (integer)
f: - rotate_rightmost_digits(number, n) take number and right most
  - to know right most we count from number size to 2
    - get number size by converting to string and getting size
  - for each right most we pass the number to the method with the right most
    and safe the result in number
  - output number
=end

def max_rotation(number)
  number_digits = number.to_s.size
  number_digits.downto(2) do |n|
    number = rotate_rightmost_digits(number, n)
  end
  number
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
