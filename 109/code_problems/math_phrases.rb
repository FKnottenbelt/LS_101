# Write a method that will generate random English math problems. The method
# should take take a lenght and return a math phrase with that many operation

=begin
i: number
o: frase
f: pick a number

   pick an operatorm (add ' by' if its divided)
   pick a number
   add to output array
   repeat num times

   join array to string with (' ') and output
=end

NUMBERS = %w(zero one two three four five six seven eight nine ten)
OPERATORS = %w(plus minus times devided)

def mathphrase(num)
  output = [NUMBERS.sample]
  num.times do
    operator = OPERATORS.sample
    output << (operator == 'devided' ? 'devided by' : operator )
    output << NUMBERS.sample
  end
  output.join(' ')
end

p mathphrase(1) #== "five minus two"
p mathphrase(2) #== "two plus three times eight"
p mathphrase(3)


### part b
# Write a progam that will generate random english math problem of varying
# lengths

=begin
i: num how many
o: mathphrase
f: generate num random nummers and call old method. I'm going to limit to 10
   max for size
=end

def random_mathprase(num)
  num.times do
    rand_num = rand(1..10)
    puts mathphrase(rand_num).capitalize + '.'
  end
end

puts "-- part b--"
random_mathprase(2)
