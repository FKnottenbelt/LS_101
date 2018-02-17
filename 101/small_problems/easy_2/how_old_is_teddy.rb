# how_old_is_teddy.rb

# Build a program that randomly generates and prints Teddy's age. To get the
# age, you should generate a random number between 20 and 200.

# Example Output
# Teddy is 69 years old!

# Further Exploration:
# Modify this program to ask for a name, and then print the age for that person.
# For an extra challenge, use "Teddy" as the name if no name is entered.

# i: nothing
# o: string with Teddy's age
# f: find age, print

def print_age(name='Teddy')
  age = rand(20..200)
  puts "#{name} is #{age} years old!"
end

print_age("John")
print_age()