# all_substrings.rb

# Write a method that returns a list of all substrings of a string. The
# returned list should be ordered by where in the string the substring begins.
# This means that all substrings that start at position 0 should come first,
# then all substrings that start at position 1, and so on. Since multiple
# substrings will occur at each position, the substrings at a given position
# should be returned in order from shortest to longest.

# You may (and should) use the substrings_at_start method you wrote in the
# previous exercise:

# f: same as previous. only chop first letter off before handing it to your
# method.
# - take your string. hand it to method. add returned array to output
# - remove first letter and hand rest to method.  add returned array to output
# - etc till string.length is zero

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

def substrings(string)
  output = []
  counter = 0

  loop do
    break if counter == string.size
    current_string = string[counter..string.size]
    output << substrings_at_start(current_string)
    counter += 1
  end
  output.flatten
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

# ls solution
def substrings(string)
  results = []
  (0...string.size).each do |start_index|
    this_substring = string[start_index..-1]
    results.concat(substrings_at_start(this_substring))
  end
  results
end