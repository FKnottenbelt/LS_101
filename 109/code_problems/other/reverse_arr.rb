# reverse_arr.rb

# reverse an array without using the built-in reverse method


# p reverse_arr([1 ,2 , 3, 4, 5, 6]) == [6, 5, 4, 3, 2, 1]
# p reverse_arr([1 ,2 , 3, 4, 5, 6, 7]) == [7, 6, 5, 4, 3, 2, 1]
# p reverse_arr([]) == []




















#=========== solutions:
puts '###### solutions ##########'

# really basic and really fast: build new array by popping last and add to new
def reverse_arr2(arr)
  counter = arr.length
  output = []
  while counter > 0
    counter -= 1
    output << arr[counter]
  end
  return output
end

p reverse_arr2([1 ,2 , 3, 4, 5, 6]) == [6, 5, 4, 3, 2, 1]
p reverse_arr2([1 ,2 , 3, 4, 5, 6, 7]) == [7, 6, 5, 4, 3, 2, 1]
p reverse_arr2([]) == []
puts '----------'

# string version
def reverse_string(string)
  counter = string.length
  output = ''
  while counter > 0
    counter -= 1
    output << string[counter]
  end
  return output
end

p reverse_string('hello') == 'olleh'
p reverse_string('helloa') == 'aolleh'
p reverse_string('') == ''
puts '----------'

## bit more involved: swapping ends and working inwards
def reverse_inplace!(arr)
  half_length = arr.length / 2
  half_length.times {|i| arr[i], arr[-i-1] = arr[-i-1], arr[i] }
  arr
end

p reverse_inplace!([1 ,2 , 3, 4, 5, 6]) == [6, 5, 4, 3, 2, 1]
p reverse_inplace!([1 ,2 , 3, 4, 5, 6, 7]) == [7, 6, 5, 4, 3, 2, 1]
p reverse_inplace!([]) == []
puts '----------'


