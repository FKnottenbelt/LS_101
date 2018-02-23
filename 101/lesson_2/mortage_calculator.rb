# mortage_calculator.rb
# ruby 2.4.1p111

# i: - loan amount in dollars, so float - p
#   - Annual Percentage Rate (APR) float
#   - loan duration , in years (float)
# o: - monthly interest rate (float)
#   - loan duration in months (float)
# r: - m = p * (j / (1 - (1 + j)**(-n)))
#     m = monthly payment
#     p = loan amount
#     j = monthly interest rate (MPR)
#     n = loan duration in months
# d: numbers, mostly floats
# example: mortage_calculator(100,1,1) => $8.38 for 12 months
# f: - welcome
#   - ask for input
#   - validate input
#   - turn APR into float (/ 100)
#   - calculate MPR as APR / 12  - j
#   - calculate loan duration in months as duration in years * 12   - n
#   - output m and n
#   - ask if we want to go again
#   - if not, say goodbye

require 'yaml'
LANGUAGE = 'eng' # set to 'eng' for English, 'dutch' for Dutch
MESSAGES = YAML.load_file('mortage_calculator_messages.yml')
NO_PARAMETER = ''
CURRENCY = (LANGUAGE == 'eng' ? '$' : '€')

def prompt(key, parameter)
  # If the messages contains a parameter in %{placeholder} form, then the
  # parameter passed into this messages should contain a hash with the place-
  # holder name as key and the parmeter as value. Have as many key-value
  # pairs as you have parameters. Example:
  # message: "Hello %{name}!"  parameter { name: first_name }
  message = MESSAGES[LANGUAGE][key] % parameter
  puts("=> #{message}")
end

def valid_float?(number)
  true if Float(number)
rescue ArgumentError
  false
end

def valid_interest?(number)
  if valid_float?(number)
    number.to_f >= 0 ? true : false
  end
end

def valid_loan?(number)
  if valid_float?(number)
    number.to_f > 0 ? true : false
  end
end

def valid_loan_duration?(number)
  if valid_float?(number)
    number.to_f > 0 ? true : false
  end
end

def get_input_loan(input_prompt, message_prompt)
  number = 0
  loop do
    prompt input_prompt, NO_PARAMETER
    number = gets.chomp
    break if valid_loan?(number)
    prompt message_prompt, NO_PARAMETER
  end
  number.to_f
end

def get_input_interest(input_prompt, message_prompt)
  number = 0
  loop do
    prompt input_prompt, NO_PARAMETER
    number = gets.chomp
    break if valid_interest?(number)
    prompt message_prompt, NO_PARAMETER
  end
  number.to_f
end

def get_input_loan_duration(input_prompt, message_prompt)
  number = 0
  loop do
    prompt input_prompt, NO_PARAMETER
    number = gets.chomp
    break if valid_loan_duration?(number)
    prompt message_prompt, NO_PARAMETER
  end
  number.to_f
end

prompt 'welcome', NO_PARAMETER

loop do # main
  loan = get_input_loan('loan', 'invalid_loan')
  interest_per_year = get_input_interest('interest', 'invalid_interest')
  loan_duration_year = get_input_loan_duration('loan_duration',
                                               'invalid_loan_duration')

  interest_per_year /= 100
  interest_per_month = interest_per_year / 12
  loan_duration_months = loan_duration_year * 12

  if interest_per_year == 0
    monthly_payment = loan / loan_duration_months
  else
    monthly_payment = loan * (interest_per_month /
    (1 - (1 + interest_per_month)**-loan_duration_months))
  end

  prompt 'result_payment', { monthly_payment: format('%.2f', monthly_payment),
                             currency: CURRENCY }
  prompt 'result_month', { loan_duration_months:
                     format('%g', loan_duration_months.round(1)) }

  answer = ''
  loop do
    prompt 'keep_going?', NO_PARAMETER
    answer = gets.chomp.downcase
    break if %w(y yeah yes n no nope).include?(answer)
    prompt 'invalid_keep_going', NO_PARAMETER
  end
  break unless %w(y yeah yes).include?(answer)
  system('clear') || system('cls')
end

prompt 'exit', NO_PARAMETER
