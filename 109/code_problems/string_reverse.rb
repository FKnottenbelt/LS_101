# Take a string as an argument, return in reverse order

=begin
f - option 1: devide by 2
      - 2 times swap elements from outside in
  - option 2
     - take from end and add to new string in a loop
  - option 3
     - use reverse
=end
def string_reverser1(string)
  half = string.size / 2
  half.times { |i| string[i], string[-i-1] = string[-i-1], string[i] }
  string
end

def string_reverser2(string)
  counter = string.size - 1
  output = ''
  loop do
    break if counter < 0
    current = string[counter]
    output << current
    counter -= 1
  end
  output
end

def string_reverser3(string)
 string.reverse
end

def do_all(string)
  p string_reverser1(string.dup)
  p string_reverser2(string)
  p string_reverser3(string)
end

do_all('hello there')
