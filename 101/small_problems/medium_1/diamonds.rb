# diamonds.rb

# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an
# odd integer that is supplied as an argument to the method. You may assume that
# the argument will always be an odd integer.

# Examples
=begin
diamond(1)

 *

diamond(3)
 *
***
 *
diamond(9)

    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *
=end

=begin
if 9 then 9 stars

4 spaces 1 star 4 spaces  9 / 2 rest = stars
3 space 3 stars 3 paces
2 space 5 stars 2 pace
1 space 7 stars 1 space
0 space 9 stars 0 space

first line: 9 / 2 rest = stars
second line:  spaces minus 1, stars plus 2.
until stars equals input. still need that line.
then either resuse lines or spaces + 1, stars minus 1
until (t/m) stars equals 1

=end

def print_line(spaces, stars)
  puts " " * spaces + "*" * stars + " " * spaces
end

def diamond(int)
  spaces, stars = int.divmod(2)
  spaces = 1 if spaces == 0

  # first half
  loop do
    print_line(spaces, stars)
    break if stars == int
    spaces -=1
    stars += 2
  end

  # second half
  loop do
    break if stars == 1
    spaces += 1
    stars -= 2
    print_line(spaces, stars)
  end
end

diamond(1)
diamond(3)
diamond(9)

# ls solution
def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end

def diamond(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end

=begin
Further Exploration

Try modifying your solution or our solution so it prints only the outline
of the diamond:

diamond(5)

  *
 * *
*   *
 * *
  *
=end