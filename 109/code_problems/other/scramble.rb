# Write function scramble(str1,str2) that returns true if a portion of str1
# characters can be rearranged to match str2, otherwise returns false.
# Only lower case letters will be used (a-z). No punctuation or digits will be
# included

p scramble('rkqodlw','world') == true
p scramble('cedewaraaossoqqyt','codewars') == true
p scramble('katas','steak') == false
p scramble('scriptjava','javascript') == true
p scramble('scriptingjava','javascript') == true






















puts '########## solution #########'
=begin
i; 2 strings
o: boolean if string 2 is in string one. but letters in string 1 are scrabled
p: need to see if the letters of string 2 are present in string 1
f: loop through string2
   see if in string 1. if so delete from str1
   if not return false
   all good: return true
=end

def scramble(str1,str2)
  str2.each_char do |char|
    if str1.include?(char)
      str1.delete(char)
    else
      return false
    end
  end
  true
end