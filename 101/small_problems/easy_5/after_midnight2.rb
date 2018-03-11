# after_midnight2.rb

# As seen in the previous exercise, the time of day can be represented as the
# number of minutes before or after midnight. If the number of minutes is
# positive, the time is after midnight. If the number of minutes is negative,
# the time is before midnight.

# Write two methods that each take a time of day in 24 hour format, and return
# the number of minutes before and after midnight, respectively. Both methods
# should return a value in the range 0..1439.
# You may not use ruby's Date and Time methods.
# Disregard Daylight Savings and Standard Time and other irregularities.

# i: time as string
# o: integer, number of minutes before/after midnight
# r: value range: 0..1439
# f: - after midnight function
#   - parse the input into hours and minutes and into integers
#   - if the hour is 0 or 24 it is midnight hour = 0
#   - if the hour is something else convert it to minutes (* 60)
#     - add it to minutes part.
#     - output
    # - before midnight function
    #   - parse the input into hours and minutes and into integers
    #   - if the hour is 0 or 24 it is midnight hour = 0
    #   - if the hour is something else do 24 - hour.
    #       - convert it to minutes (* 60)
    #   - do hour in minutes - minutes and output

MINUTES_IN_HOUR = 60

def before_midnight(time)
  hour = time.slice(0, 2).to_i
  minutes = time.slice(3, 2).to_i

  case hour
  when 0
    hour_minutes = 0
  when 24
    hour_minutes = 0
  else
    hour = 24 - hour
    hour_minutes = hour * MINUTES_IN_HOUR
  end

  hour_minutes - minutes
end

p before_midnight('00:00') == 0
p before_midnight('12:34') == 686
p before_midnight('24:00') == 0

def after_midnight(time)
  hour = time.slice(0, 2).to_i
  minutes = time.slice(3, 2).to_i

  hour_minutes = case hour
                 when 0 then 0
                 when 24 then 0
                 else hour * MINUTES_IN_HOUR
                 end

  hour_minutes + minutes
end

p after_midnight('00:00') == 0
p after_midnight('12:34') == 754
p after_midnight('24:00') == 0


# LS solution:
HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(time_str)
  hours, minutes = time_str.split(':').map(&:to_i)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(time_str)
  delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
  delta_minutes
end