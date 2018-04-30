# abc.rb
=begin
A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to just those words that do
  not use both letters from any given block. Each block can only be used once.

Write a method that returns true if the word passed in as an argument can be
spelled from this set of blocks, false otherwise.
========
i: string word
o: boolean - true if the input word can be spelled by blocks using only one side of
the block . NB upper or downcase
f: throw block away if you used it
d: mulitdemsional array
f: loop through the array and for each sub array see if it contains one of the
wanted letters
  - by looping through letters of input string. if match delete from input
  and break to next block
  - if at the end imput string is empty return true
=end

BLOCKS = [['B','O'], ['G','T'], ['V','I'], ['X','K'], ['R','E'], ['L','Y'],
          ['D','Q'], ['F','S'], ['Z','M'], ['C','P'], ['J','W'], ['N','A'],
          ['H','U']]

def block_word?(input_word)
  word = input_word.dup.upcase
  BLOCKS.each do |block|
    counter = 0
    loop do
      break if counter == word.size
      if word.include?(block[0])
        word.delete!(block[0])
        counter = word.size - 1
      elsif
        word.include?(block[1])
        word.delete!(block[1])
        counter = word.size - 1
      end
      counter += 1
    end
  end
  word.empty? ?  true : false
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

# ls solution
BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(string)
  up_string = string.upcase
  BLOCKS.none? { |block| up_string.count(block) >= 2 }
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?('cook')