# next_featured_num.rb

=begin
A featured number (something unique to this exercise) is an odd number that is a
multiple of 7, and whose digits occur exactly once each. So, for example, 49 is
a featured number, but 98 is not (it is not odd), 97 is not (it is not a
multiple of 7), and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, and returns the
next featured number that is greater than the argument. Issue an error message
if there is no next featured number.
===
I integer
o: next featured number or error message
f; - find the next odd multiple of 7
   - test output for double digits
   - in not featured, go to next odd multiple.

   - so when to give an error?
   "That is handled by checking the highest possible unique value"

=end
def featured(num)
  num += 1
  num += 1 until num.odd? && num % 7 == 0

  loop do
    numbers = num.digits
    return num if numbers.uniq == numbers
    num += 14
    break if num >= 9_876_543_210
  end
  'There is no possible number that fulfills those requirements.'
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those
#requirements
