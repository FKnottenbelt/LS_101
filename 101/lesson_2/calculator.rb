# calculator.rb

# Build a command line calculator program that does the following:

#     asks for two numbers
#     asks for the type of operation to perform: add, subtract, multiply or
#     divide
#     displays the result

# Use the Kernel.gets() method to retrieve user input, and use Kernel.puts()
# method to display output. Remember that Kernel.gets() includes the newline,
# so you have to call chomp() to remove it: Kernel.gets().chomp().
##########

# flow:
# ask the user for two numbers
# ask the user for a operation to perform: add, subtract, multiply or divide
# perform the operation on the 2 numbers
# output the result

require 'yaml'
LANGUAGE = 'dutch' # set to 'eng' for English, 'dutch' for Dutch
MESSAGES = YAML.load_file('calculator_messages.yml')

# accessing the now nested hash in the .yml file
# chosing first the language, then the message
def messages(key, lang='eng')
  MESSAGES[lang][key]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  Kernel.puts("=> #{message}")
end

# since I can't get it to work with the more complicated prompts
def simple_prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i.to_s == num || num.to_f.to_s == num
end

def operation_to_message(op)
  action =  case op
            when '1'
              'Adding'
            when '2'
              'Subtracting'
            when '3'
              'Multiplying'
            when '4'
              'Dividing'
            end
  action
end

prompt('welcome')

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?
    prompt('valid_name')
  else
    break
  end
end

# getting a message with a Ruby variable from the .yml file, means putting a
# placeholder in the .yml file. In this case that is %{name} like so:
# hello: "Hello %{name}". When calling the message with the hash key 'hello',
# we then tell ruby to how to substitute the place holder. So here we say that
# the placehoder `name:` should be replaced with our ruby variable `name`.
simple_prompt(MESSAGES[LANGUAGE]['hello'] % { name: name })

loop do # main
  number1 = ''
  loop do
    prompt('first_number')
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt('invalid_nubmer')
    end
  end

  number2 = ''
  loop do
    prompt('second_number')
    number2 = Kernel.gets().chomp()
    if valid_number?(number2)
      break
    else
      prompt('invalid_number')
    end
  end

  # the <<-MSG trick won't work with .yml so we replace that in the .yml file
  # with newline characters (\n)
  prompt('operator')
  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('invalid_operator')
    end
  end

  simple_prompt(MESSAGES[LANGUAGE]['performing_operation'] %
  { performing_method: operation_to_message(operator) })

  result =  case operator
            when '1'
              number1.to_i() + number2.to_i()
            when '2'
              number1.to_i() - number2.to_i()
            when '3'
              number1.to_i() * number2.to_i()
            when '4'
              number1.to_f() / number2.to_f()
            end

  simple_prompt(MESSAGES[LANGUAGE]['result'] % { result: result })
  prompt('keep_going?')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt('exit')
