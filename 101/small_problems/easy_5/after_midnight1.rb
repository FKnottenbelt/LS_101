# after_midnight1.rb
# The time of day can be represented as the number of minutes before or
# after midnight. If the number of minutes is positive, the time is after
# midnight. If the number of minutes is negative, the time is before midnight.

# Write a method that takes a time using this minute-based format and
# returns the time of day in 24 hour format (hh:mm). Your method should
# work with any integer input.

# You may not use ruby's Date and Time classes.

# Examples:

# p time_of_day(0) == "00:00"
# p time_of_day(-3) == "23:57"
# p time_of_day(35) == "00:35"
# p time_of_day(-1437) == "00:03"
# p time_of_day(3000) == "02:00"
# p time_of_day(800) == "13:20"
# p time_of_day(-4231) == "01:29"

# Disregard Daylight Savings and Standard Time and other complications.

# i: integer, - or + representing minutes
# o: "hh:mm" string in 24 hour format
# f: 24:00 is midnight.
#   - split the minutes into hours and minutes
#   - if positive add to 00:00
#   - if negative substract from 24:60

def time_of_day(num)
  hours, minutes = num.divmod(60)
  hours.abs > 24 ? hours = hours % 24 : hours

  case hours <=> 0
  when +1 then hours = hours
  when -1 then hours = 24 + hours
  else         hours = hours
  end

  format('%.2d', hours) + ":" + format('%.2d', minutes)
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

# LS solution:
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def time_of_day(delta_minutes)
  delta_minutes =  delta_minutes % MINUTES_PER_DAY
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

#Further Exploration

# How would you approach this problem if you were allowed to use ruby's
# Date and Time classes? Suppose you also needed to consider the day of
# week? (Assume that delta_minutes is the number of minutes before or
# after midnight between Saturday and Sunday; in such a method, a
# delta_minutes value of -4231 would need to produce a return value
# of Thursday 01:29.)

require 'time'

def time_of_day(minutes)
  midnight = Time.mktime(2018, 1, 1)
  seconds = minutes * 60
  new_time = midnight + seconds
  new_time.strftime('%H:%M')
end