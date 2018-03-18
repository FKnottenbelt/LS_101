# daily_double.rb

# Write a method that takes a string argument and returns a new string that
# contains the value of the original string with all consecutive duplicate
# characters collapsed into a single character. You may not use
# String#squeeze or String#squeeze!.

# i:: string
# o: squeezed string
# r: - no squeeze
#   - only consecutive duplicate's get removed (so no unique)
#   - empty returns empty
# f: - loop through collection,
#   - if current value <> last value, append to output

# simple loop version
def crunch(string)
  counter = 0
  crunched = ''

  loop do
    break if counter == string.size
    if string[counter] != string[counter - 1]
      crunched << string[counter]
    elsif counter == 0
      crunched << string[counter]
    end
    counter += 1
  end
  crunched
end

# map version. (using each_char for variation)
def crunch(string)
  crunched = ''
  string.each_char.map.with_index do |char, i|
    if i == 0
      crunched << char
    elsif char != crunched[-1]
      crunched << char
    end
  end
  crunched
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

# ls solution
def crunch(text)
  index = 0
  crunch_text = ''
  while index <= text.length - 1
    crunch_text << text[index] unless text[index] == text[index + 1]
    index += 1
  end
  crunch_text
end