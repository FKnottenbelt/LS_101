# ### 2- calculate number of Friday the 13ths in a year
# Write a method that returns the number of Friday the 13ths in the year
# passed in as an argument. [...]
# ruby's Date class may be helpfull: the friday? method

=begin
i year
o: number of fry 13ths (integer)
f: loop trough all 13th days of each month,
   ask if it is a friday
   count if yes.
   output count
=end

require 'date'

def friday_13th(year)
  count = 0
  month = 1
  loop do
    break if month > 12
    day = Date.new(year, month, 13)
    count += 1 if day.friday?
    month += 1
  end
  count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
