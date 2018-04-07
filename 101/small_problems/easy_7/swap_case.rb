# swap_case.rb
# Write a method that takes a string as an argument and returns a new string
# in which every uppercase letter is replaced by its lowercase version, and
# every lowercase letter by its uppercase version. All other characters should
# be unchanged.

# You may not use String#swapcase; write your own version of this method.

# i: string
# o: string A =>a,  a => A
# f: we are transforming and looping so: .map
# -split sting it chars
# - for each char
#   - if in upcase range do downcase
#   - in in downcase range do upcase
#   - else just copy
#  - join output array back to string

def swapcase(string)
  string.chars.map do |char|
    if ('A'..'Z').include?(char)
      char.downcase!
    elsif ('a'..'z').include?(char)
      char.upcase!
    else
      char
    end
  end.join()
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
