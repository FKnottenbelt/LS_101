# fib_arr.rb
# select the element out of the array if its index is a fibonacci number


# arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n']
# p find_fib_index(arr) == ['b', 'c', 'd', 'f', 'i', 'n']
# arr = ['a', 'b']
# p find_fib_index(arr) == ['b']




















############ solution:
puts '###### solutions ##########'
def fibonacci(num)
  return true if num == 1 || num == 2
  first, last = [1, 1]
  3.upto(num + 1) do  # use + 1 because you don't want the nth number but
                      # the number itself. so go passed it
    first, last = [last, first + last]
    return true if last == num
  end
  false
end

def find_fib_index(arr)
  arr.select.each.with_index do |element, index|
    fibonacci(index)
  end
end

arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n']
p find_fib_index(arr) == ['b', 'c', 'd', 'f', 'i', 'n']
arr = ['a', 'b']
p find_fib_index(arr) == ['b']

# p fibonacci(7) #== 13
# p fibonacci(1) == 1
# p fibonacci(2) == 1
# p fibonacci(3) == 2
# p fibonacci(4) == 3
# p fibonacci(5) == 5


# different solution. includes 0 in fib series
arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n']
def is_fibonacci?(i, x = 1, y = 0)
  return true if i == x || i == 0
  return false if x > i
  is_fibonacci?(i, x + y, x)
end

output =
arr.select.with_index do |val, index|
  is_fibonacci?(index)
end

p output == ['a', 'b', 'c', 'd', 'f', 'i', 'n']
=begin
This works because if you call a method such as select without a block, you
get an Enumerator object, on which you can then chain more Enumerable methods.
=end