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

p longest_palindrome('abcbd') == 'bcb'
p longest_palindrome('abba') == 'abba'
p longest_palindrome('abcbdeffe') == 'effe'

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
Write a method that takes an array of consecutive (increasing) letters as
input and that returns the missing letter in the array.

You will always get an valid array. And it will be always exactly one letter
be missing. The length of the array will always be at least 2.
The array will always contain letters in only one case.

p find_missing_letter(["a","b","c","d","f"]) == "e"
p find_missing_letter(["O","Q","R","S"]) == "P"
p find_missing_letter(["b","d"]) == "c"
p find_missing_letter(["a","b","d"]) == "c"
p find_missing_letter(["b","d","e"]) == "c"

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
Given a string, find the number character that is repeated most times and
return it's numeric value. If multiple characters are repeated the same time,
return first one.
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
Return -1 if there is no answer.

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

# 14 - Sum of integers from string
Your task is to implement a function that calculates the sum of the integers inside a string.-->
For example, in the string "The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog",-->
the sum of the integers is 3635.-->

puts sum_of_integers_in_string("12.4") == 16
puts sum_of_integers_in_string("h3ll0w0rld") == 3
puts sum_of_integers_in_string("2 + 3 = ") == 5
puts sum_of_integers_in_string("Our company made approximately 1 million in gross revenue last quarter.") == 1
puts sum_of_integers_in_string("The Great Depression lasted from 1929 to 1939.") == 3868
puts sum_of_integers_in_string("Dogs are our best friends.") == 0
puts sum_of_integers_in_string("C4t5 are 4m4z1ng.") == 18
puts sum_of_integers_in_string("The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog") == 3635

# 15 - Count repeats
Write a function that returns the count of characters that have to be
removed in order to
get a string with no consecutive repeats.
Examples:
'abbbbc'  => 'abc'    #  answer: 3
'abbcca'  => 'abca'   #  answer: 2
'ab cca'  => 'ab ca'  #  answer: 1

puts count_repeats('abbc') == 1
puts count_repeats('abbcca') == 2
puts count_repeats('ab cca') == 1
puts count_repeats('ccffda&& !!!re') == 5

# 16 - find n smallest
Your task is to write a function that returns the n smallest elements of an
array in original order. The number of elements to be returned cannot be
higher than the array length, elements can be duplicated, in case of
duplicates, just return them according to the original order (see third
test case).
(nb 6 kyu, might take a bit longer)

p first_n_smallest([1,2,3,4,5],3) == [1,2,3]
p first_n_smallest([5,4,3,2,1],3) == [3,2,1]
p first_n_smallest([1,2,3,4,1],3) == [1,2,1]
p first_n_smallest([1,2,3,-4,0],3) == [1,-4,0]
p first_n_smallest([1,2,3,4,5],0) == []
p first_n_smallest([9, -6, 8, 3, -2, 9, 0, -10, 2, 3, 5, 0, 5, -8, 0, 10, 5, 0, -9, 0, -3, 1], 10) == [-6, -2, 0, -10, 0, -8, 0, 0, -9, -3]

# 17 - find shortest word
Given a string of words, return the length of the shortest word(s).

puts find_short("bitcoin take over the world maybe who knows perhaps") == 3
puts find_short("turns out random test cases are easier than writing out basic ones") == 3
puts find_short("lets talk about javascript the best language") == 3
puts find_short("i want to travel the world writing code one day") == 1
puts find_short("Lets all go on holiday somewhere very cold") == 2

# 18 - Format words into sentence
Complete the method so that it formats the words into a single comma
separatedvalue. The last word should be separated by the word 'and'
instead of a comma. The method takes in an array of strings and
returns a single formatted string.
Empty string values should be ignored. Empty arrays or null/nil
values being passed into the method should result in an empty
string being returned.

p format_words(['ninja', 'samurai', 'ronin']) == "ninja, samurai and ronin"
p format_words(['ninja', '', 'ronin']) == "ninja and ronin"
p format_words([]) == ""

#edge case extra's
p format_words(nil) == ""
p format_words([nil]) == ""
p format_words(['ninja', 'samurai']) == 'ninja and samurai'
p format_words(['ninja']) == 'ninja'
p format_words(['']) == ''
p format_words(['ninja','']) == 'ninja'
p format_words(['','ninja']) == 'ninja'

# 19 split in parts
Your task is to split a given string into different strings of
equal size (note that the size of strings is passed to the
method).

Example: Split the  string below into strings of size 3
'supercalifragilisticexpialidocious'
Your method should return a new string
'sup erc ali fra gil ist ice xpi ali doc iou s'

puts split_in_parts("supercalifragilisticexpialidocious", 3) == "sup erc ali fra gil ist ice xpi ali doc iou s"
puts split_in_parts("HelloKata", 1) == "H e l l o K a t a"
puts split_in_parts("HelloKata", 9) == "HelloKata"

# 20 Values of consonant substrings
Given a lowercase string that has alphabetic characters only and no spaces, return the highest value of consonant substrings.
A consonant is any letter of the alphabet except a, e, i ,o, u. The consonant substrings in the word "zodiacs"
are z, d, cs. Assuming a = 1, b = 2 ... z = 26, the values of these substrings are 26 ,4, 22 because z = 26,
d = 4,cs=3+19=22. The maximum value of these substrings is 26. Therefore, solve("zodiacs") = 26.

puts solve("zodiacs") == 26
puts solve("chruschtschov") == 80
puts solve("khrushchev") == 38
puts solve("strength") == 57
puts solve("catchphrase") == 73
puts solve("twelfthstreet") == 103
puts solve("mischtschenkoana") == 80
