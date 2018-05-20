# Given 2 strings, your job is to find out if there is a substring
# that appears in both strings. You will return true if you find a
# substring that appears in both strings, or false if you do not.
#  We only care about substrings that are longer than one letter long.

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



# so in home?
# om in home? yes => stop en true
#   me in home?

# p substring_test('test', 'lllt') == false
# te in lllt?
# es in lllt
#   st in lllt
# nee => false

# - alles eerst downcase
# - je moet de start letter steeds 1 schuiven
# - je moet de eind letter steeds 1 schuiven
# -> totdat de eind letter is eind string1 lengte

# opties: 1 - een index achtige per letter
# 2 - een geneste loop. outer loop voor start letter, inner loop
# voor eind letter. Maar dan moet je de range per loop aangeven
# dwz: hoe ver moet outer loop gaan? -> 0 tot lengte -1
# en van waar tot waar moet de inner loop gaan? -> start + 1 tot eind

# optie 1 (wat ik zou doen):
def substring_test1(str1, str2)
  str1.downcase!
  str2.downcase!

  counter1 = 0
  counter2 = 1

  loop do
    break if counter1 == str1.length
    break if counter2 == str1.length

    substring = str1[counter1] + str1[counter2]
    return true if str2.include?(substring)

    counter1 += 1
    counter2 += 1
  end
  false
end

# optie 2:
# maar deze loopt van so naar something
# dan om naar omthing
# dan mt naar mthing etc.
# lijkt wat overbodig...
def substring_test(str1, str2)
  str1.downcase!
  str2.downcase!

  ( 0...( str1.size - 1 ) ).each do |start_char|

    ( ( start_char + 1 )...str1.size ).each do |end_char|

      substring = str1[start_char..end_char]
      return true if str2.include?(substring)

    end
  end

  false
end

=begin
LS student algorithm:
Process the Problem
Input:
- two strings
Output:
- boolean
Requirements:
- tale two strings
- find a substring that appears in both strings, that is longer than 1 char
- return true if found, false if not
Rules:
Model the Problem:
Search for every substring in str1 to see if str2 has a match. If so then
return true. Then search arcross every substring in str2 to see if str1
containsputs  it.
Data Structures / Algorithm
- use a start and end variable to search across the string
- the start variable will be index 0
- the end variable will be index + 1 until the it equals the size of the string
- for each substring, use regex to see if str1 contains it. if so, return true.
- Then do the same for str2 (I think?)
- return false otherwise
=end
# Code:
def substring_test(str1, str2)
  str1.downcase!
  str2.downcase!

  ( 0...( str1.size - 1 ) ).each do |start_char|

    ( ( start_char + 1 )...str1.size ).each do |end_char|

      substring = str1[start_char..end_char]
      return true if str2.include?(substring)

    end
  end

  false
end
