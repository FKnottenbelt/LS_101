# other good review questions

## 1 - Index if Fibonacci number
select the element out of the array if its index is a fibonacci number


arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n']
p find_fib_index(arr) == ['b', 'c', 'd', 'f', 'i', 'n']
arr = ['a', 'b']
p find_fib_index(arr) == ['b']

## 2 - multiples of 3
Given an array of numbers find if any 3 numbers inside of the array
can be multiplied to get the maximum number in the array.
If the number is used once it can't be used again. If there are two same
numbers then that number can be used 2 times.

p mult_of_three_nums([1,2,3,4,5,6]) == true
p mult_of_three_nums([3, 8, 0, 9, 4, 2, 7]) == false
p mult_of_three_nums([5, 3, 7, 9, 2, 51, 90]) == true
p mult_of_three_nums([1, 1, 5, 7, 987, 3, 2]) == true
p mult_of_three_nums([2, 5, 8, 11, 32, 2]) == true
p mult_of_three_nums([13, 3, 11, 56, 79, 2]) == false

## 3 - palindrome_without_reverse

write a method to determine if a word is a palindrome, without using the
reverse method

p palindrome?('hello') == false
p palindrome?('madam') == true

## 4 - reverse array without reverse
reverse an array without using the built-in reverse method

p reverse_arr([1 ,2 , 3, 4, 5, 6]) == [6, 5, 4, 3, 2, 1]
p reverse_arr([1 ,2 , 3, 4, 5, 6, 7]) == [7, 6, 5, 4, 3, 2, 1]
p reverse_arr([]) == []

## 5 - longest palindrome
Write a method that takes in a string of lowercase letters (no
uppercase letters, no repeats). Consider the *substrings* of the
string: consecutive sequences of letters contained inside the string.
Find the longest such string of letters that is a palindrome.

Note that the entire string may itself be a palindrome.

puts(
  'longest_palindrome("abcbd") == "bcb": ' +
  (longest_palindrome('abcbd') == 'bcb').to_s
)
puts(
  'longest_palindrome("abba") == "abba": ' +
  (longest_palindrome('abba') == 'abba').to_s
)
puts(
  'longest_palindrome("abcbdeffe") == "effe": ' +
  (longest_palindrome('abcbdeffe') == 'effe').to_s
)

## 6 - overlapping substrings
Given 2 strings, your job is to find out if there is a substring
that appears in both strings. You will return true if you find a
substring that appears in both strings, or false if you do not.
We only care about substrings that are longer than one letter long.

p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', 'Fun') == false
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'lllt') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true

## 7 - to Weird Case
Write a function toWeirdCase (weirdcase in Ruby) that accepts a string, and
returns the same string
with every 4th character in a word upcase. Other characters should remain the
same.

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') == 'LorEm IpsUm is simPly dumMy texT of the priNtinG'
p to_weird_case('It is a long established fact that a reader will be distracted') == 'It is a lonG estAbliShed facT thaT a reaDer wilL be disTracTed'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case('Merry Poppins word is supercalifragilisticexpialidocious') == 'MerRy PopPins worD is supErcaLifrAgilIstiCexpIaliDociOus'


## 8 - missing letters
Write a method that takes an array of consecutive (increasing) letters as input and that returns the missing letter in the array.

You will always get an valid array. And it will be always exactly one letter be missing. The length of the array will always be at least 2.
The array will always contain letters in only one case.

find_missing_letter(["a","b","c","d","f"]) == "e"
find_missing_letter(["O","Q","R","S"]) == "P"
find_missing_letter(["b","d"]) == "c"
find_missing_letter(["a","b","d"]) == "c"
find_missing_letter(["b","d","e"]) == "c"

## 9 - factorial
Write a program that outputs the factorial of the numbers 5, 6, 7, and 8.
#=> 120, 720, 5040, 40320