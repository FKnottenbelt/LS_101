=begin
Your task is to split a given string into different strings of equal size (note that the size of strings is passed to the method)
Example: Split the  string below into strings of size 3
'supercalifragilisticexpialidocious'
Your method should return a new string
'sup erc ali fra gil ist ice xpi ali doc iou s'
=end

puts split_in_parts("supercalifragilisticexpialidocious", 3) == "sup erc ali fra gil ist ice xpi ali doc iou s"
puts split_in_parts("HelloKata", 1) == "H e l l o K a t a"
puts split_in_parts("HelloKata", 9) == "HelloKata"













##################3
=begin
i: string, number (cut into val)
o: modified string
f: loop though string
   slice! n chars to new arr
   join with space
=end

def split_in_parts(string, cut)
  string.dup
  out = []
  loop do
    break if string.empty?
    out << string.slice!(0,cut)
  end
  out.join(' ')
end

# top solution
def split_in_parts(s, part_length)
  output = []
  s.chars.each_slice(part_length) { |s| output << s.join('') }
  output.join(' ')
end