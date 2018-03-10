# select_letter.rb

# Let's write a method called select_letter, that takes a string and returns
# a new string containing only the letter that we specified. We want it to
# behave like this:

# question = 'How many times does a particular character appear in this sentence?'
# select_letter(question, 'a') # => "aaaaaaaa"
# select_letter(question, 't') # => "ttttt"
# select_letter(question, 'z') # => ""

def select_letter(string, letter)
  selected_letters = ''
  counter = 0

  loop do
    break if counter == string.size

    current_char = string[counter]
    selected_letters << current_char if current_char == letter

    counter += 1
  end
  selected_letters
end

question = 'How many times does a particular character appear in this sentence?'
p select_letter(question, 'a') # => "aaaaaaaa"
p select_letter(question, 't') # => "ttttt"
p select_letter(question, 'z') # => ""

# And because select_letter returns a string, if we wanted to, we can continue
# to chain string methods on the return value. Suppose we wanted to find out
# how many times a letter occurs in a sentence, we could use our method above
# chained with String#size, like so

p select_letter(question, 'a').size # => 8
p select_letter(question, 't').size # => 5
p select_letter(question, 'z').size # => 0