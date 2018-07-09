# Write a method that combines to arrays passed in as agruments, and returns
# a new array that contains all elements from both Array arguments, with the
# elements taken in alternation

=begin
i: 2 arrays
o: one interleaved array
f: zip a 1 with a 2, this will give multidimensiol arr. so flatten
=end

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave([1,2,3],['a','b','c']) #== [1,'a',2,'b',3,'c']

###
# without zip

=begin
i: 2 arrays
o: one interleaved array
f: get index 0 from arr 1, then index 0 from arr2
   get index 1 from arr 1, then index 1 from arr2
   get index 3 from arr 1, then index 3 from arr2
   so till arr.size - 1
   add to output arr
=end

def interleave_basic(arr1, arr2)
  output = []
  counter = 0
  loop do
    break if counter == arr1.size
    output << arr1[counter]
    output << arr2[counter]
    counter += 1
  end
  output
end

p interleave_basic([1,2,3],['a','b','c']) #== [1,'a',2,'b',3,'c']