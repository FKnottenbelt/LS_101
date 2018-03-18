# bannerizer_wrap.rb

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

# Further Exploration

# Modify this method so it will truncate the message if it will be too wide
# to fit inside a standard terminal window (80 columns, including the sides
# of the box). For a real challenge, try word wrapping very long messages
# so they appear on multiple lines, but still within a box.

# f: - only line3 will change. you can have more than 1 line3
#   - max line is 80 - 4  so split string in bits of 76
#   - each bit gets one line3
#   - so: slice the string in bits of max 76
#     - puts line1 en 2
#     - loop through string bits and puts line 3 for each
#     - puts line 2 and 1
#
#   - slicer: take string. if bigger than max_line,
#     slice!(0,maxline) into sliced
#     else break. Rinse and repeat
MAX_WIDTH = 80
BOX_SIDES = 4
MAX_LINE = MAX_WIDTH - BOX_SIDES

def string_slicer(string)
  counter = 0
  sliced = []
  loop do
    if string.size >= MAX_LINE
      sliced << string.slice!(0, MAX_LINE)
    else
      sliced << string
      break
    end
    counter += 1
  end
  sliced
end

def bannerize(string)
  string_bits = string_slicer(string)
  max_bit = string_bits.max.size

  line1 = '+-' + ('-' * max_bit) + '-+'
  line2 = '| ' + (' ' * max_bit) + ' |'

  puts line1
  puts line2
  string_bits.each do |bit|
    puts '| ' + bit + ' |'
  end
  puts line2
  puts line1
end

bannerize('To boldly go where no one has gone before.')
bannerize('Hello World!')
bannerize('This is a fairly straight forward solution To simplify matters, we start out by setting horizontal_rule and empty_line to appropriate values for the top and bottom 2 lines of the box. ')
