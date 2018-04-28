# fibonacci_procedural.rb
# Rewrite your recursive fibonacci method so that it computes its results without
# recursion.

def fibonacci(num)
  return 1 if num == 1 || num == 2
  arr = [1, 1]
  counter = 2

  loop do
    break if counter == num
    index = counter - 1
    result = arr[index] + arr[index - 1]
    arr << result
    counter += 1
  end
  arr.last
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
# fibonacci(100_001) # => 4202692702.....8285979669707537501

# ls solution
def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last
end
