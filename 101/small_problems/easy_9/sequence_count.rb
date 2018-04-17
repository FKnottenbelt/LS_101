# sequence_count.rb

# Create a method that takes two integers as arguments. The first argument is a
# count, and the second is the first number of a sequence that your method will
# create. The method should return an Array that contains the same number of
# elements as the count argument, while the values of each element will be
# multiples of the starting number.

# You may assume that the count argument will always have a value of 0 or
# greater, while the starting number can be any integer value. If the count
# is 0, an empty list should be returned.

# i: count, start number (can be negative)
# o: sequence of count elements starting at start num, adding start num
# f: count times add start num to total and add total to output array
# exc: count 0 returns empty array

def sequence(count, start_num)
  counter = 0
  total = 0
  output = []

  loop do
    break if counter == count
    total += start_num
    output << total
    counter += 1
  end
  output
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

#ls solutioon
def sequence(count, first)
  (1..count).map { |idx| idx * first }
end
