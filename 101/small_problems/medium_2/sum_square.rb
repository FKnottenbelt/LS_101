# sum_square.rb

=begin
Write a method that computes the difference between the square of the sum of
the first n positive integers and the sum of the squares of the first n
positive integers.

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
=end


















puts "#### solution ####"
=begin
i: int
o: (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
f: make an range of 1 to int.
   make that to an arry and sum it.
   then square it. dat is num1

   use the array again, now loop through it and square each number
   sum it. thats num2

   output num1 - num2
=end

def sum_square_difference(int)
  arr = (1..int).to_a
  num1 = arr.sum ** 2
  num2 = arr.map { |n| n ** 2}.sum
  num1 - num2
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150

# ls solution
def sum_square_difference(n)
  sum = 0
  sum_of_squares = 0

  1.upto(n) do |value|
    sum += value
    sum_of_squares += value**2
  end

  sum**2 - sum_of_squares
end
