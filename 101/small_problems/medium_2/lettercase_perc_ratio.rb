# lettercase_perc_ratio.rb

# In the easy exercises, we worked on a problem where we had to count the number
# of uppercase and lowercase characters, as well as characters that were neither
# of those two. Now we want to go one step further.

# Write a method that takes a string, and then returns a hash that contains 3
# entries: one represents the percentage of characters in the string that are
# lowercase letters, one the percentage of characters that are uppercase letters,
# and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.
=begin
I: string
o: hash with { lowercase: 50, uppercase: 10, neither: 40 } with the numbers
  being percentages
f: using the old method (easy 7) to give numbers now we need to convert to
 percentages:
 - count size of input string
 - read hash and compute percentage
    - (100/size) * number
 - write percentage to hash instead of hard number
 - output hash
=end

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

def letter_percentages(string)
  hash = letter_case_count(string)
  hash.each do |k, v|
    hash[k] = (100 / string.size.to_f) * v
  end
  hash
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }

# ls solution
def letter_percentages(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }
  percentages = { lowercase: [], uppercase: [], neither: [] }
  characters = string.chars
  length = string.length

  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }

  calculate(percentages, counts, length)

  percentages
end

def calculate(percentages, counts, length)
  percentages[:uppercase] = (counts[:uppercase] / length.to_f) * 100
  percentages[:lowercase] = (counts[:lowercase] / length.to_f) * 100
  percentages[:neither] = (counts[:neither] / length.to_f) * 100
end
