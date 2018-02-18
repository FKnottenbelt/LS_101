# mortage_calculator.rb

# i: - loan amount in dollars, so float - p
#   - Annual Percentage Rate (APR) float
#   - loan duration , in years (integer)
# o: - monthly interest rate (float)
#   - loan duration in months (float)
# r: - m = p * (j / (1 - (1 + j)**(-n)))
#     m = monthly payment
#     p = loan amount
#     j = monthly interest rate (MPR)
#     n = loan duration in months
# d: numbers
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

def messages(key, lang = 'eng', variable = '')
  message = if variable == ''
              MESSAGES[lang][key]
            else
              MESSAGES[lang][key] % variable
            end
  message
end

def prompt(key, variable = '')
  message = messages(key, LANGUAGE, variable)
  puts("=> #{message}")
end

def valid_float?(number)
  true if Float(number)
rescue
  false
end

def get_input(input_prompt, message_prompt)
  number = 0
  loop do
    prompt input_prompt
    number = gets
    valid_float?(number) ? number = number.to_f : number
    break if valid_float?(number) && number > 0
    prompt message_prompt
  end
  number
end

prompt 'welcome'

loop do # main
  loan = get_input('loan', 'invalid_loan')
  interest_per_year = get_input('interest', 'invalid_interest')
  loan_duration_year = get_input('loan_duration', 'invalid_loan_duration')

  interest_per_year /= 100
  interest_per_month = interest_per_year / 12 # j
  loan_duration_months = loan_duration_year * 12 # n

  # caluculate monthly payment as
  # m = p * (j / (1 - (1 + j)**(-n)))
  monthly_payment = loan * (interest_per_month /
    (1 - (1 + interest_per_month)**-loan_duration_months))

  prompt 'result_payment', { monthly_payment: format('%.2f', monthly_payment) }
  prompt 'result_month', { loan_duration_months: loan_duration_months.round(0) }

  prompt 'keep_going?'
  answer = gets.chomp.downcase
  break unless %w(y yeah yes).include?(answer)
  system('clear') || system('cls')
end # main

prompt 'exit'
