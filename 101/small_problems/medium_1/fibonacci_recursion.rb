# fibonacci_recursion.rb

=begin
The Fibonacci series is a sequence of numbers starting with 1 and 1 where each
number is the sum of the two previous numbers: the 3rd Fibonacci number is
1 + 1 = 2, the 4th is 1 + 2 = 3, the 5th is 2 + 3 = 5, and so on. In
mathematical terms:

F(1) = 1
F(2) = 1
F(n) = F(n - 1) + F(n - 2) where n > 2

Sequences like this translate naturally as "recursive" methods. A recursive
method is one in which the method calls itself. For example:

def sum(n)
  return 1 if n == 1
  n + sum(n - 1)
end

sum is a recursive method that computes the sum of all integers between 1 and n.

Recursive methods have three primary qualities:

    They call themselves at least once.
    They have a condition that stops the recursion (n == 1 above).
    They use the result returned by themselves.

In the code above, sum calls itself once; it uses a condition of n == 1 to
stop recursing; and, n + sum(n - 1) uses the return value of the recursive
call to compute a new return value.

Write a recursive method that computes the nth Fibonacci number, where nth
is an argument to the method.

This exercise is a lead-in for the next two exercises. It verges on the
Advanced level, so don't worry or get discouraged if you can't do it on
your own. Recursion is tricky, and even experienced developers can have
trouble dealing with it.
=============

F(1) = 1
F(2) = 1
F(n) = F(n - 1) + F(n - 2) where n > 2

1- base
2- recursion
3- get closer to base

input: num
ouput: nth num
basic problem: give me the sum of 2 numbers

- step one. write nonrecursive method
  have an array [1, 1] and a counter at 2
  count up from counter to n
  for eacht count, add index (counter-1) - 1 and index -2
  and shovel the result.
- isolate a single iteration
    result = arr[index] + arr[index - 1]
    arr << result
- expres this with n
    result = arr[n] + arr[n - 1]
    arr << result
- step two: create an exit strategy (base case).
  return n in an if statement at the beginning
  break if counter == num
- step three: add recursive method call
 - most often in the return value of the method (but not the base)
 - using n like n-1
=end

def fibonacci(nth)
  return 1 if nth <= 2
  fibonacci(nth - 1) + fibonacci(nth - 2)
end

p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5

def fibonacci1(num)
  #return num if num <= 1
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
  p arr
  arr.last
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765