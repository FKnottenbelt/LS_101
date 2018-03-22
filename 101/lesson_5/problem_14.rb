# problem_14.rb

# Given this data structure write some code to return an array containing
# the colors of the fruits and the sizes of the vegetables. The sizes should
# be uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

# The return value should look like this:

# [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

output =
hsh.map do |key, value|
  new_arr = []
  if value[:type] == 'fruit'
    new_arr << value[:colors].map { |color| color.capitalize }
  else
    new_arr << value[:size].upcase
  end
  new_arr
end

p output

# ls solution
hsh.map do |_, value|
  if value[:type] == 'fruit'
    value[:colors].map do |color|
      color.capitalize
    end
  elsif value[:type] == 'vegetable'
    value[:size].upcase
  end
end
