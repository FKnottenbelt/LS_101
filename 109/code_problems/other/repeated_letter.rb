=begin
Given a string, find the number character that is repeated most times and return
it's numeric value. If multiple characters are repeated the same time, return
first one.
If there are no numeric characters in a string return nil.
=end

p re_letter('There isn\' any number here!') == nil
p re_letter('%^&*()!') == nil
p re_letter('111222333') == 1
p re_letter('1234335521444') == 4
p re_letter('') == nil
p re_letter('011-555-333-23') == 3
p re_letter('1') == 1
p re_letter('444352893599119') == 9

















puts "####### solution ##"
=begin
i: string
out: char first most reapeat  or nil if not number
f: make into array
   write to hash
   find max. key for max
   if max is number return max coverted to number else nil
=end

def re_letter(string)
  return nil if string.empty?

  hash = Hash.new{0}
  string.each_char do |char|
    hash[char] += 1
  end

  most = hash.key(hash.values.max)

  if ('0'..'9').include?(most)
    return most.to_i
  else
    return nil
  end
end

# alternative
=begin
loop through char
if number write to hash
get key of max hash value
return first value as integer
nil if no numbers
=end
def re_letter(string)
  nums = Hash.new{0}
  string.chars do |char|
    if ('0'..'9').include?(char)
      nums[char] += 1
    end
  end

  return nil if nums.empty?
  nums.key(nums.values.max).to_i
end

# alternataive with regex
def re_letter(string)
  nums = Hash.new{0}
  string.scan(/\d/).each do |char|
    nums[char] += 1
  end

  return nil if nums.empty?
  nums.key(nums.values.max).to_i
end
