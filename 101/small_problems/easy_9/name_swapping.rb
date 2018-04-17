# name_swapping.rb

# Write a method that takes a first name, a space, and a last name passed as
# a single String argument, and returns a string that contains the last name,
# a comma, a space, and the first name.

# i: full name string
# o: modified string name: last, comma, space , first
# f: split name, reverse, join

def swap_name(full_name)
  full_name.split().reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
