# lettercase_counter.rb

# Write a method that takes a string, and then returns a hash that contains
# 3 entries: one represents the number of characters in the string that
# are lowercase letters, one the number of characters that are uppercase letters,
# and one the number of characters that are neither.

# f: loop trough a string
#   compare each character to a range of lowercase letters (next if fits)
#   , a range of uppercase letters. (next if fits)
#   if it fits, count to hash.
#   if it is not one of the above: count to neither

def letter_case_count(string)
  output = { lowercase: 0, uppercase: 0, neither: 0 }
  string.each_char do |char|
    if ('a'..'z').include?(char) then output[:lowercase] += 1
    elsif ('A'..'Z').include?(char) then output[:uppercase] += 1
    else output[:neither] += 1
    end
  end
  output
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
