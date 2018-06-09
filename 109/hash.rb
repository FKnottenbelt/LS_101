# Accessing hashes
#############

##########
# Variation 1:
# complete hashes in a 'array-container'
# you first get to the object (computer)
# then to keys and values
PRODUCTS = [
  { name: "Thinkpad x210" , price: 220 },
  { name: "Thinkpad x220" , price: 250 },
  { name: "Thinkpad x250" , price: 979 },
  { name: "Thinkpad x230" , price: 300 },
  { name: "Thinkpad x230" , price: 330 },
  { name: "Thinkpad x230" , price: 350 },
  { name: "Thinkpad x240" , price: 700 },
  { name: "Mackbook x220" , price: 250 },
  { name: "Dell Latitude" , price: 200 },
  { name: "Dell Latitude" , price: 650 },
  { name: "Dell Inspiron" , price: 300 },
  { name: "Dell Inspiron" , price: 450 }
]

# not usefull:
PRODUCTS.each do |k, v|
  puts "key: #{k}"
  puts "value: #{v}"
end

# key: {:name=>"Thinkpad x210", :price=>220}
# value:
# key: {:name=>"Thinkpad x220", :price=>250}
# value:
# etc
puts '----'

# better:
PRODUCTS.each do |computer|
  puts computer
end
# {:name=>"Thinkpad x210", :price=>220}
# {:name=>"Thinkpad x220", :price=>250}
# {:name=>"Thinkpad x250", :price=>979}
# etc
puts '----'

PRODUCTS.each do |computer|
  puts computer[:name]
  puts computer[:price]
end
# Thinkpad x210
# 220
# Thinkpad x220
# 250
# etc
puts '----'

# or
PRODUCTS.each do |computer|
  computer.each do |k, v|
    puts "key: #{k}"
    puts "value: #{v}"
  end
end
# key: name
# value: Thinkpad x210
# key: price
# value: 220
# etc
puts '----'

out =
PRODUCTS.sort_by do |computer|
  computer[:price]
end
p out
puts '----'

# other example:
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

##########
# Variation 2:
# pure hash, with hash values (key and data)
# you go straight to key and values
# then to parts of the value v['age']


munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |k, v|
  puts "key: #{k}"
  puts "value: #{v}"
end
puts '----'
# key: Herman
# value: {"age"=>32, "gender"=>"male"}

# not usefull: you still - basically - have what you had..
munsters.each do |person|
  p person
end
#["Herman", {"age"=>32, "gender"=>"male"}]
puts '----'

# thus this does not work:
# munsters.each do |person|
#   puts person['age']
#   puts person['gender']
# end

munsters.each do |k, v|
  puts v['age']
  puts v['gender']
end
# 32
# male
puts '----'

output =
munsters.sort_by do |k, v|
  v['age']
end
p output
puts '----'

# other example

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

hsh.each do |k, v|
  p v[:colors]
end
# ["red", "green"]
# ["orange"]
puts '----'


