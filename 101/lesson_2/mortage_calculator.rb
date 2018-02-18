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
# f: - welcome
#   - ask for input
#   - validate input
#   - turn APR into float (/ 100)
#   - calculate MPR as APR / 12  - j
#   - calculate loan duration in months as duration in years * 12   - n
#   - output m and n
#   - ask if we want to go again
#   - if not, say goodbye

def prompt(message)
  puts(">> " + message)
end

prompt "Welcome to the mortage caculator!"

loop do # main
  loan = 0 # p
  loop do
    prompt "How much do you want to borrow?"
    loan = gets.to_f
    break if Float(loan) && loan > 0
    prompt "Please enter a valid loan amount greater than 0"
  end

  interest_per_jear = 0
  loop do
    prompt "How much interest are you willing to pay?"
    interest_per_jear = gets.to_i
    break if Integer(interest_per_jear) && interest_per_jear > 0
    prompt "please enter interest as an integer greater then 0"
  end

  loan_duration_years = 0
  loop do
    prompt "How many years do you want to loan?"
    loan_duration_years = gets.to_i
    break if Integer(loan_duration_years) && loan_duration_years > 0
    prompt "please enter loan duration as an integer greater then 0"
  end

  interest_per_jear = interest_per_jear.to_f / 100
  interest_per_month = interest_per_jear / 12 # j
  loan_duration_months = loan_duration_years * 12 # n

  # caluculate monthly payment as
  # m = p * (j / (1 - (1 + j)**(-n)))
  monthly_payment = loan * (interest_per_month /
    (1 - (1 + interest_per_month)**-loan_duration_months))

  prompt "Your monthly payment will be $#{format('%.2f', monthly_payment)}"
  prompt "for the duration of #{loan_duration_months} months."

  prompt "do you want to calculate again? y for yes"
  answer = gets.chomp.downcase
  break unless answer == 'y' || answer == 'yes' || answer == 'yeah'
end # main

prompt "Thank you for using the mortage calculator. Goodbye!"
