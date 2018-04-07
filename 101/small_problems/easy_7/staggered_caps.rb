# staggered_caps.rb

# Write a method that takes a String as an argument, and returns a new
# String that contains the original value using a staggered capitalization
# scheme in which every other character is capitalized, and the remaining
# characters are lowercase. Characters that are not letters should not be
# changed, but count as characters when switching between upper and lowercase.

# i; string
# o: string
# f: loop and transform: .map (with index)
# - split string into chars
# - if index is even: upcase
#   else downcase
# - join back to string

def staggered_case(string)
  string.chars.map.with_index do |char, index|
    index.even? ? char.upcase : char.downcase
  end.join()
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# Further Exploration

# Modify this method so the caller can request that the first character be
# downcased rather than upcased? If the first character is downcased, then
# the second character should be upcased, and so on.

def staggered_case2(string, stagger='first')
  string.chars.map.with_index do |char, index|
    if stagger == 'first'
      index.even? ? char.upcase : char.downcase
    elsif stagger == 'second'
      index.odd? ? char.upcase : char.downcase
    end
  end.join()
end

p staggered_case2('I Love Launch School!', 'first') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case2('ALL_CAPS', 'second') == 'aLl_cApS'
p staggered_case2('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
