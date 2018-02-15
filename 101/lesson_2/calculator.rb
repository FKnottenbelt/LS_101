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
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
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

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt(MESSAGES['hello'] % { name: name })

loop do # main
  number1 = ''
  loop do
    prompt(MESSAGES['first_number'])
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt(MESSAGES['invalid_nubmer'])
    end
  end

  number2 = ''
  loop do
    prompt(MESSAGES['second_number'])
    number2 = Kernel.gets().chomp()
    if valid_number?(number2)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end

  prompt(MESSAGES['operator'])
  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['invalid_operator'])
    end
  end

  prompt(MESSAGES['performing_operation'] %
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

  prompt(MESSAGES['result'] % { result: result })
  prompt(MESSAGES['keep_going?'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES['exit'])
