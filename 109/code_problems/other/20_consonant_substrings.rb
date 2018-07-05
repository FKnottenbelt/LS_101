=begin
Given a lowercase string that has alphabetic characters only and no spaces, return the highest value of consonant substrings.
A consonant is any letter of the alphabet except a, e, i ,o, u. The consonant substrings in the word "zodiacs"
are z, d, cs. Assuming a = 1, b = 2 ... z = 26, the values of these substrings are 26 ,4, 22 because z = 26,
d = 4,cs=3+19=22. The maximum value of these substrings is 26. Therefore, solve("zodiacs") = 26.
=end

puts solve("zodiacs") == 26
puts solve("chruschtschov") == 80
puts solve("khrushchev") == 38
puts solve("strength") == 57
puts solve("catchphrase") == 73
puts solve("twelfthstreet") == 103
puts solve("mischtschenkoana") == 80
















#########
=begin
i: string just letters lowercase
o  int hightest of the values of the non vowels substrings
f: replace (sub) all vowels by space
   array with letter values
   loop throufh words
     through chars. add char values.
   if the word value is bigger than save value
      if so save

   output save
=end

def solve(string)
  arr = string.split('').map { |char| %w(a e i o u).include?(char) ? " ": char }.join.split(' ')
  letter = ("a".."z").to_a
  save = 0
  arr.each do |word|
    sum = 0
    word.split('').each do |char|
      sum += letter.index(char) + 1
    end
    save = sum if sum > save
  end
  save
end

# alternative
=begin
array of letter values
substing of consonants
  scan consecutive non vowels => array with substrings
  loop through array
    for each substring
      loop through chars and add value to substring value
    compare to save value

return hightest value (int)
=end

def solve(string)
 values = ('a'..'z').to_a
 save = 0
 substr_value = 0
 arr = string.scan(/[^aeiou]+/)
 arr.each do |substr|
   substr_value = 0
   substr.each_char do |char|
     substr_value += values.index(char) + 1
   end
   save = substr_value if substr_value > save
 end
 save
end


# student solution
def solve(str)
  sstr_values = str.scan(/[^aeiou]+/).map do |sstr|
    sstr.chars.reduce(0) { |mem, val| mem += val.ord - 96 }
  end
  sstr_values.max
end


# Nb:
# replace vowels with spaces with regex
"zodiacs".gsub(/[aeiou]/,' ') #=> 'z d cs'
# get all consecutive consonants
"zodiacs".scan(/[^aeiou]+/) #=>  ["z", "d", "cs"]
