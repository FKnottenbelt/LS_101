# format_words_into_sentence.rb 6 kyu

=begin
Complete the method so that it formats the words into a single comma
separatedvalue. The last word should be separated by the word 'and'
instead of a comma. The method takes in an array of strings and
returns a single formatted string.
Empty string values should be ignored. Empty arrays or null/nil
values being passed into the method should result in an empty
string being returned.

=end


p format_words(['ninja', 'samurai', 'ronin']) == "ninja, samurai and ronin"
p format_words(['ninja', '', 'ronin']) == "ninja and ronin"
p format_words([]) == ""

# edge case extra's
p format_words(nil) == ""
p format_words([nil]) == ""
p format_words(['ninja', 'samurai']) == 'ninja and samurai'
p format_words(['ninja']) == 'ninja'
p format_words(['']) == ''
p format_words(['ninja','']) == 'ninja'
p format_words(['','ninja']) == 'ninja'








puts '######## solution ###########'
=begin
i: array with strings
o: sentence (formated)
r: 1 word : just word
   2 words:  word and word
   3 words: word comma word and word
   4 words: word comma word comma and word
   0 words or nil or [nil]: ""
f: take care of edge cases:
   return '' if nil
   delete all "" words
   take of the last 2 words and join with and. put back
   join with comma
=end
def format_words(words)
  return "" if words.nil?
  words.delete("")  # or words.reject! { |word| word == "" }
  words << words.pop(2).join(" and ")
  words.join(", ")

# top solution
def format_words(words)
  words.reject(&:empty?).join(', ').gsub(/, (\w+)$/) { " and #{$1}" } rescue ''
end


