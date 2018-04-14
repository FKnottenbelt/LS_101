# leading_substrings.rb

# Write a method that returns a list of all substrings of a string that
# start at the beginning of the original string. The return value should
# be arranged in order from shortest to longest substring.

# i: string
# o: array of strings: all substrings starting with [0]. sorted by length

# f: start = [0], end is counter till == string length
#   put all substrings in array

def substrings_at_start(string)
  output = []
  counter = 0
  loop do
    break if counter == string.size
    substring = string[0..counter]
    output << substring
    counter += 1
  end
  output
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# ls solution
def substrings_at_start(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end