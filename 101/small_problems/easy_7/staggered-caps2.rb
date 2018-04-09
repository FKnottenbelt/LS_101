# staggered-caps2.rb

# Modify the method from the previous exercise so it ignores non-alphabetic
# characters when determining whether it should uppercase or lowercase
# each letter. The non-alphabetic characters should still be included
# in the return value; they just don't count when toggling the desired case.

# f: walk through the chars.
# - use a counter instead of an index. start at 0
# - if it is a letter and counter is even
#         do upcase and update counter
#       else just output
#   elseif it is is a letter and counter is odd do downcase
#       else just output
#   repeat.


def staggered_case(string)
  counter = 0
  string.chars.map do |char|
    if counter.even? && ('a'..'z').include?(char.downcase)
      counter += 1
      char.upcase
    elsif counter.odd? && ('a'..'z').include?(char.downcase)
      counter += 1
      char.downcase
    else
      char
    end
  end.join()
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

