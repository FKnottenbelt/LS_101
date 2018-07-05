# Write a function that returns the count of characters that have to be
# removed in order to
# get a string with no consecutive repeats.
# Examples:
# 'abbbbc'  => 'abc'    #  answer: 3
# 'abbcca'  => 'abca'   #  answer: 2
# 'ab cca'  => 'ab ca'  #  answer: 1



puts count_repeats('abbc') == 1
puts count_repeats('abbcca') == 2
puts count_repeats('ab cca') == 1
puts count_repeats('ccffda&& !!!re') == 5
















##################
=begin
i: string
o: int sum to the amount to be removed chars
f: split

    if current is save, count + 1
    if not move to save
  return count
=end

def count_repeats(string)
  save =''
  count = 0
  string.split('').each do |char|
    if char == save
      count += 1
    else
      save = char
    end
  end
  count
end