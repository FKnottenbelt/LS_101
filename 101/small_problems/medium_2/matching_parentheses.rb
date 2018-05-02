# matching_parentheses.rb
=begin
Write a method that takes a string as argument, and returns true if all
parentheses in the string are properly balanced, false otherwise. To be properly
balanced, parentheses must occur in matching '(' and ')' pairs.

Note that balanced pairs must each start with a (, not a ).
==
i: string with ()
o: true if ()
  false if ( or )
  no () = true
f - can count ()
  - see if first is ( and last is )
  - extract them in to array.
  - the count of ( should be equal to )
=end

def balanced?(string)
  parentheses = string.chars.select { |char| char == ")" || char == '(' }
  if parentheses.count % 2 == 0 && parentheses.first == "(" &&
     parentheses.last == ")"
    parentheses.count("(") == parentheses.count(")")
  elsif parentheses.empty?
    true
  else
    false
  end
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false

# ls solution
def balanced?(string)
  parens = 0
  string.each_char do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    break if parens < 0
  end

  parens.zero?
end

# clever LS student solution
def balanced?(str)
  result = str.chars.select { |char| char == '(' || char == ')' }.join

  loop do
    break if result.gsub!('()', '') == nil
  end

  result.empty? ? true : false
end

# Further Exploration

# There are a few other characters that should be matching as well.
# Square brackets and curly brackets normally come in pairs. Quotation
# marks(single and double) also typically come in pairs and should be
# balanced. Can you expand this method to take into account those characters?