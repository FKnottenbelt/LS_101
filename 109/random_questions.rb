VAR_SCOPE = %w(3 4 5 22 23 24 25 26 27 28 29 31 32)
SHADOW = %w(33 34)
SHARING = %w(35 18 19 20 21)
COLLECTIONS = %w(6 7 8 9 10 11 12 13 14 15 36 16 17)
LOOPS = %w(2)
POINTER = %w(37 42)
PUTS_VS_RETURN = %w(38 39)
NIL = %w(40 41)

todo = []
todo << VAR_SCOPE.sample
todo <<  SHARING.sample
todo <<  SHADOW.sample
todo <<  COLLECTIONS.sample
todo <<  LOOPS.sample
todo <<  PUTS_VS_RETURN.sample
todo <<  POINTER.sample
todo <<  NIL.sample

puts "How many questions do you want right now? (max #{todo.count})"
answer = gets.chomp

todo.shuffle!
output = []
answer.to_i.times { |_| output << todo.pop }
puts "Please do #{output.join(', ')} from the file practice_questions.md"
