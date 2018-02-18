# odd_numbers.rb

# Print all odd numbers from 1 to 99, inclusive. All numbers should be printed
# on separate lines.

(1..99).each do |num|
  num.even? ? next : puts(num)
end

# alternative (one of many)
puts 1.upto(9).select(&:odd?)
