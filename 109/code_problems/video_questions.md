# Video questions:

## watch-others-code-recording-part-1
#### 1a - calculating primes 4:11
write a method that will determine whether an integer is a prime.
Don't use the prime class.
p is_prime?(3) == true
p is_prime?(4) == false

#### 1b:
Write a method that will take an array of numbers and only return those that
are prime

p select_primes([1, 2, 3, 4]) == [2,3]
p select_primes([4, 6, 8, 10]) == []

#### 1c: (ends 25:45)
write a method that will take an array of numbers, and return the number of
primes in the array

p count_primes([1, 2, 3, 4]) == 2
p count_primes([4, 6, 8, 10]) == 0

### 2- finding sum or product of a series of numbers
write a programm that ask the user to return an integer > 0, than ask if the
user wants to determine the sum or hte product of all numbers between 1 and the
entered integer.

### 3- interleave two arrays
Write a method that combines to arrays passed in as agruments, and returns
a new array that contains all elements from both Array arguments, with the
elements taken in alternation

p interleave([1,2,3],['a','b','c']) == [1,'a',2,'b',3,'c']


## watch-others-code-recording-part-4
### 1 - capitalize
Write a method that takes a single string argument and returns a new string
that contains the original value of the argument, but the first letter of
every word is now capitalized.

p word_cap('four score "and" seven') == 'Four Score "and" Seven'

### 2- calculate number of Friday the 13ths in a year
Write a method that returns the number of Friday the 13ths in the year
passed in as an argument. [...]
ruby's Date class may be helpfull: the friday? method

p friday_13th(2015) == 3
p friday_13th(1986) == 1

#### 3a- generate random English mathematical phrases (at 24:50)
Write a method that will generate random English math problems. The method
should take take a lenght and return a math phrase with that many operations

p mathphrase(1) == "five minus two"
p mathphrase(2) == "two plus three times eight"
given:
NUMBERS = %w(zero one two three four five six seven eight nine ten)
OPERATORS = %w(plus minus times devided)

#### 3b: any length
Write a progam that will generate random english math problem of varying
lengths


## beginning-ruby-part-4
### 1- string reverser
Take a string as an argument, return in reverse order
### 2- FizzBuzz
Write a method that takes two arguments: the first is the starting
number, and the second is the ending number. Print out all numbers
between the two numbers, except if a number is divisible by 3, print
"Fizz", if a number is divisible by 5, print "Buzz", and finally if
a number is divisible by 3 and 5, print "FizzBuzz"

p fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

### 3- Laptop query
Implement the search method

PRODUCTS = [
  { name: "Thinkpad x210" , price: 220 },
  { name: "Thinkpad x220" , price: 250 },
  { name: "Thinkpad x250" , price: 979 },
  { name: "Thinkpad x230" , price: 300 },
  { name: "Thinkpad x230" , price: 330 },
  { name: "Thinkpad x230" , price: 350 },
  { name: "Thinkpad x240" , price: 700 },
  { name: "Mackbook x220" , price: 250 },
  { name: "Dell Latitude" , price: 200 },
  { name: "Dell Latitude" , price: 650 },
  { name: "Dell Inspiron" , price: 300 },
  { name: "Dell Inspiron" , price: 450 }
]

query = {
  price_min: 240,
  price_max: 280,
  q: 'thinkpad'
}

query2 = {
  price_min: 300,
  price_max: 450,
  q: 'dell'
}

def search(query)
  # your code here
end

p search(query)
#=>[ { name: "Thinkpad x220" , price: 250 } ]

p search(query2)
#=> [ { name: "Dell Inspiron" , price: 300 },
#=>  { name: "Dell Inspiron" , price: 450 }]


## beginning-ruby-part-5
### 1 - remove vowels
Write a method that takes an array of strings and returns an array of
the same string values, except with the vowels removed

p remove_vowels(['yellow', 'green', 'black']) == ['yllw', 'grn', 'blck']