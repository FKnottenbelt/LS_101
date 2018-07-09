# Write a method that takes 2 numbers. It should print out all primes
# between those two numbers. Don't use the ruby prime class

=begin
i: 2 integers
o: primes between those two
r: prime: number > 1 that only devides by 1 and itself
f:   - make a method is prime?
       - range from 2 to n
       - false if 1
       - if n % rangenum == 0 return false, else true

   - make a range of all the numbers between num 1 and num 2
   - loop through range and ask for each  number if it is prime
     - if yes: output num
=end
def is_prime?(num)
  return false if num <= 1
  (2...num).each do |n|
    return false if num % n == 0
  end
  true
end

def find_primes(num1, num2)
  (num1..num2).each do |n|
    puts n  if is_prime?(n)
  end
end

p is_prime?(7) == true
p is_prime?(4) == false

find_primes(3, 10) #=> 3, 5, 7
find_primes(5, 20) #=> 5, 7, 9, 13, 17 19
find_primes(1, 2)  #=> 2