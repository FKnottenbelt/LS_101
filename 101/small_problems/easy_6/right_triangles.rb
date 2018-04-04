# right_triangles.rb

# Write a method that takes a positive integer, n, as an argument, and displays
# a right triangle whose sides each have n stars. The hypotenuse of the triangle
# (the diagonal side in the images below) should have one end at the lower-left
# of the triangle, and the other end at the upper-right.

# Examples:

# triangle(5)

#     *
#    **
#   ***
#  ****
# *****

# triangle(9)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********

# f: line1 n - 1 spaces and 1 stars
#   line2 n - 2 spaces and 2 stars
#   line3 n - 3 spaces and 3 stars
#   [...]
#   last  n - n spaces and n stars

#   so I need a counter going up from 1 to n
#   a loop going from up from 1 to n and in each iteration
#   I print a line, upping the counter in between loops

def triangle(int)
  counter = 1
  loop do
    break if counter > int
    puts " " * (int - counter) + ("*" * counter)
    counter += 1
  end
end

triangle(9)
triangle(5)
