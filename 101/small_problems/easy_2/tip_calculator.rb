# tip_calculator.rb

# Create a simple tip calculator. The program should prompt for a bill amount
# and a tip rate. The program must compute the tip and then display both the
# tip and the total amount of the bill.

# Example:

# What is the bill? 200
# What is the tip percentage? 15

# The tip is $30.0
# The total is $230.0

# i: bill amount (float) and tip rate (float)
# o: tip and total bill in dollars (float)
# r: - total bill = amount + (amount / 100) * tip

puts "What is the bill?"
amount = gets.to_f

puts "What is the tip percentage?"
tip_percentage = gets.to_f

tip = (amount * (tip_percentage / 100)).round(2)
total = (amount + tip).round(2)

puts "The tip is $#{format('%.2f', tip)}"
puts "The total is $#{format('%.2f', total)}"
