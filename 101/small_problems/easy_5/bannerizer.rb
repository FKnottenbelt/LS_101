# bannerizer.rb

# Write a method that will take a short line of text, and print it within a box.
# Example:

# print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

# print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+

# You may assume that the input will always fit in your terminal window.

# i: string
# o: string in box
# r: - box grows with string (2 extra on each side)
#   - basic box is 4 by 4
# f: - puts first line = +- plus - * string.size plus -+
#   - puts second line = | plus 2 spaces plus spaces * string.size plus |
#   - puts third line = | plus space + string + space plus |
#   - puts fourth line = second line
#   - puts fifth line = first line

def bannerize(string)
  line1 = '+-' + ('-' * string.size) + '-+'
  line2 = '| ' + (' ' * string.size) + ' |'
  line3 = '| ' + string + ' |'

  puts line1
  puts line2
  puts line3
  puts line2
  puts line1
end

bannerize('To boldly go where no one has gone before.')
bannerize('Hello World!')
