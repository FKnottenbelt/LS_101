# alphabetic_numbers.rb

# Write a method that takes an Array of Integers between 0 and 19, and returns
# an Array of those Integers sorted based on the English words for each number:

# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven,
# twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen
# example
# alphabetic_number_sort((0..19).to_a) == [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#   6, 16, 10, 13, 3, 12, 2, 0
# ]
# i: array of integers between (including) 0 and 19. Unique integers
# o: sorted array of integers
# r: sort on basis of tekst order:
#   8 = eight
#   0 = zero
#   so 8 before 0
# f: - translate integer to english (lookup table => hash)
#   - lookup the placement (index) in an array consisting of the
#     sorted values of the english array
#   - input our integer in a new array at the found index number
#   - get rid of nils (non used places)
#   - output array

NUM_TO_ENGLISH = { 0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three',
                   4 => 'four', 5 => 'five', 6 => 'six' }

def alphabetic_number_sort(integer_array)
  keys = NUM_TO_ENGLISH.values.sort
  output_arr = []

  integer_array.each do |int|
    english = NUM_TO_ENGLISH[int]
    placement = keys.index(english)
    output_arr[placement] = int
  end

  output_arr.delete(nil)
  output_arr
end

p alphabetic_number_sort((0..6).to_a) #== [5, 4, 1, 6, 3, 2, 0]
p alphabetic_number_sort((2..4).to_a) #== [4, 3, 2]
p alphabetic_number_sort([4,2,3]) #== [4, 3, 2]
# ]
# p alphabetic_number_sort((0..19).to_a) == [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#   6, 16, 10, 13, 3, 12, 2, 0
# ]

# LS solution
NUMBER_WORDS = %w(zero one two three four
                  five six seven eight nine
                  ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(numbers)
  numbers.sort_by { |number| NUMBER_WORDS[number] }
end
