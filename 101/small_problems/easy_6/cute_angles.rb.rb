# cute_angles.rb
# Write a method that takes a floating point number that represents an
# angle between 0 and 360 degrees and returns a String that represents
# that angle in degrees, minutes and seconds. You should use a degree
# symbol (°) to represent degrees, a single quote (') to represent
# minutes, and a double quote (") to represent seconds. A degree has
# 60 minutes, while a minute has 60 seconds.

# Examples:

# p dms(30) == %(30°00'00")
# p dms(76.73) == %(76°43'48")
# p dms(254.6) == %(254°36'00")
# p dms(93.034773) == %(93°02'05")
# p dms(0) == %(0°00'00")
# p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# Note: your results may differ slightly depending on how you round values,
# but should be within a second or two of the results shown.

# You should use two digit numbers with leading zeros when formatting the
# minutes and seconds, e.g., 321°03'07".

# You may use this constant to represent the degree symbol:
# DEGREE = "\xC2\xB0"

# i: float between 0 and 360 = degree
# s: string representing angle (the float) in degrees, minutes and seconds
# r: - use a degree symbol (°) to represent degrees, a single quote (') to
#   represent minutes, and a double quote (") to represent seconds.
#   formula: (https://www.thoughtco.com/decimal-degrees-conversion-1434592)
#   - the bit before the decimal will stay the same = degree
#   - multiply everything after the dot * 60
#       - take the result. the whole number = minutes
#       - multiply remainder * 60  = seconds
#       - add your 3 numbers
# f: - split the float into degree and rest
#   - rest * 60
#   - split into minutes and rest
#   - rest * 60 = seconds
#   - add and format

DEGREE = "\xC2\xB0"

def dms(angle)
  degree, rest = angle.divmod(1)
  rest = rest * 60
  minutes, seconds = rest.divmod(1)
  seconds = seconds * 60
  "#{degree}#{DEGREE}#{format('%.2d', minutes)}'#{format('%.2d', seconds)}\""
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
