# when_will_i_retire.rb

# Build a program that displays when the user will retire and how many years
# she has to work till retirement.

# Example:

# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!

puts 'What is your age?'
age = gets.to_i
puts 'At what age would you like to retire?'
retirement_age = gets.to_i
year = Time.new.year
retirement_year = (retirement_age - age) + year
years_to_go = retirement_year - year
puts "It's #{year}. You will retire in #{retirement_year}"
puts "You have only #{years_to_go} years of work to go!"
