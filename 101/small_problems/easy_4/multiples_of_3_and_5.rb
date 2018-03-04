# multiples_of_3_and_5.rb

# Write a method that searches for all multiples of 3 or 5 that lie between 1
# and some other number, and then computes the sum of those multiples. For
# instance, if the supplied number is 20, the result should be
# 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

# i:  integer > 0
# o: integer
# f: - find als multiples of 3 or 5 between (and inlcuding) 1 and the input
#     number
#         - find if a number is a mutiople of 3 or 5
#         - it has to be between 1 and number
#         - add all found multiples

def multisum(number)
  counter = 1
  arr = []
  while counter <= number
    if counter % 5 == 0 || counter % 3 == 0
      arr << counter
    end
    counter += 1
  end
  arr.reduce(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
