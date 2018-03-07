# ascii_string_value.rb

# Write a method that determines and returns the ASCII string value of a
# string that is passed in as an argument. The ASCII string value is the
# sum of the ASCII values of every character in the string. (You may use
# String#ord to determine the ASCII value of a character.)

# i: string
# o: ascii value of the string
# r: ascii value = sum (char ascii)

def ascii_value(string)
  sum = 0
  string.each_char { |char| sum += char.ord }
  sum
end

def ascii_value(str)
  return 0 if str.empty?
  str.chars.map { |char| char.ord }.inject(:+)
end

def ascii_value(string)
  return 0 if string.empty?
  arr = []
  string.chars.each do |char|
    arr.push(char.ord)
  end
  arr.inject(:+)
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

def ascii_value(string)
  sum = 0
  string.each_char { |char| sum += char.ord }
  sum
end