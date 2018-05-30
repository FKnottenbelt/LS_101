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

## 10 - scramble
Write function scramble(str1,str2) that returns true if a portion of str1
characters can be rearranged to match str2, otherwise returns false.
Only lower case letters will be used (a-z). No punctuation or digits will be
included

p scramble('rkqodlw','world') == true
p scramble('cedewaraaossoqqyt','codewars') == true
p scramble('katas','steak') == false
p scramble('scriptjava','javascript') == true
p scramble('scriptingjava','javascript') == true

## 11 - repeated letters
Given a string, find the number character that is repeated most times and return
it's numeric value. If multiple characters are repeated the same time, return
first one.
If there are no numeric characters in a string return nil.

p re_letter('There isn\' any number here!') == nil
p re_letter('%^&*()!') == nil
p re_letter('111222333') == 1
p re_letter('1234335521444') == 4
p re_letter('') == nil
p re_letter('011-555-333-23') == 3
p re_letter('1') == 1
p re_letter('444352893599119') == 9

## 12 - Matching brackets with starting point
You will be given a string with brackets and an index of an opening bracket
and your task will be to return the index of the matching closing bracket.
Return -1 if there #is no answer.

puts solve("((1)23(45))(aB)", 0) == 10
puts solve(")(1)23(45))(aB)", 0) == -1
puts solve("((1)23(45))(aB)", 1) == 3
puts solve("((1)23(45))(aB)", 2) == -1
puts solve("((1)23(45))(aB)", 6) == 9
puts solve("((1)23(45))(aB)", 11) == 14
puts solve("(g(At)IO(f)(tM(qk)YF(n)Nr(E)))", 11) == 28
puts solve("(g(At)IO(f)(tM(qk)YF(n)Nr(E)))", 0) == 29
puts solve("(>_(va)`?(h)C(as)(x(hD)P|(fg)))", 19) == 22
puts solve("((1(23(45((aB", 0) == -1

# 13 - simple card game
Steve and Josh are dealt the same number of cards. They both flip the card
on the top of their deck. Whoever has a card with higher value wins the round
and gets one point (if the cards are of the same value, neither of them
gets a point). After this, the two cards are discarded and they flip another
card from the top of their deck. They do this until they have no cards left.

deckSteve and deckJosh are arrays representing their decks. They are filled
with cards, represented by a single character. The card rank is as follows
(from lowest to highest):

'2','3','4','5','6','7','8','9','T','J','Q','K','A'

Every card may appear in the deck more than once. Figure out who is going
to win and return who wins and with what score:

"Steve wins x to y"
if Steve wins, where x is Steve's score, y is Josh's score;

"Josh wins x to y"
if Josh wins, where x is Josh's score, y is Steve's score;

"Tie"
if the score is tied at the end of the game.

Example:
Steve is dealt:
['A','7','8']
Josh is dealt:
['K','5','9']
    In first round, ace beats king and Steve gets one point.
    In second round, 7 beats 5 and Steve gets his second point.
    In third round, 9 beats 8 and Josh gets one point.

You should return:
"Steve wins 2 to 1"

p winner(["A", "7", "8"], ["K", "5", "9"]) == "Steve wins 2 to 1"
p winner(["T"], ["T"]) == "Tie"
p winner(["K", "5"], ["A", "7"]) == "Josh wins 2 to 0"

