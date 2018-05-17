# calc_primes.rb

## part a
# write a method that will determine whether an integer is a prime.
# Don't use the prime class.

=begin
i: integer
o: boolean
r: prime : divisible only by 1 and itself
f: make range from 2 to num
   see if you can divide num by any number from range.
   if true return false
   else return true
=end

def is_prime?(num)
  return false if num == 1
  (2...num).each do |n|
    return false if num % n == 0
  end
  true
end

p is_prime?(3) == true
p is_prime?(4) == false

## part b
# Write a method that will take an array of numbers and only return those that
# are prime

=begin
i: array of integers
o: array with primes from input
f: select from array if element is prime
r: prime must be a whole number greater than 1
=end

def select_primes(arr)
  arr.select { |el| is_prime?(el) }
end

p select_primes([1, 2, 3, 4]) == [2, 3]
p select_primes([4, 6, 8, 10]) == []


## part c
# write a method that will take an array of numbers, and return the number of
# primes in the array

=begin
i: array of integers
o: integer: number of primes in the array
f: select the primes, count them
=end
def count_primes(arr)
  select_primes(arr).count
end

p count_primes([1, 2, 3, 4]) == 2
p count_primes([4, 6, 8, 10]) == 0

#ls solution:
def count_primes(arr)
 arr.count { |value| prime?(value) }
end

