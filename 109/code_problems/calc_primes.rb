# calc_primes.rb

# write a method that will determine whether an integer is a prime.
# Don't use the prime class.

# p is_prime?(3) == true
# p is_prime?(4) == false

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
  (2...num).each do |n|
    return false if num % n == 0
  end
  true
end

p is_prime?(3) == true
p is_prime?(4) == false