# how_big_is_the_room.rb

# Build a program that asks a user for the length and width of a room in meters
# and then displays the area of the room in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

# Do not worry about validating the input at this time.

# Example Run

# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).

# i: length and width in meters
# o: string with area in both square meters and square feet
# r: - area in meters = length * width
#   - area in feet = area in meters * 10.7639

SQMETERS_TO_SQFEET = 10.7639

def calculate_room_size(length, width)
  area_in_meters = (length * width).round(2)
  area_in_feet = (area_in_meters * SQMETERS_TO_SQFEET).round(2)
  "The area of the room is #{area_in_meters} square meters
  (#{area_in_feet} square feet)."
end

puts "Enter the length of the room in meters:"
length = gets.to_f
puts "Enter the width of the room in meters:"
width = gets.to_f
puts calculate_room_size(length, width)
