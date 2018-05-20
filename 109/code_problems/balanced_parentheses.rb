# Write a method that takes a string and returns a boolean indicating whether
# this string has a balanced set of parentheses.

=begin
i: string
o: boolean (balanced?)
r: () is balanced
f: - delete all non ()
   - now we count
    [- first one should be ( (if not return false)]
    - for each ( add 1 to open
    - for each ) add 1 to close
      - break if close > open with false
=end

def balancer(string)
  str = string.delete('^()')
  openp = 0
  closep = 0
  counter = 0

  loop do
    break if counter == str.size
    str[counter] == '(' ? openp += 1 : closep += 1
    return false if closep > openp
    counter += 1
  end
  openp == closep
end

p balancer("hi") == true
p balancer("(hi") == false
p balancer("(hi)") == true

#bonus
p balancer(")hi(") == false
