# problem_2

# How would you order this array of hashes based on the year of publication
# of each book, from the earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]


out1 = books.sort_by { |_,_,date| date }


people = { Kate: 27, john: 25, Mike:  18 }
sorted_people =
people.sort_by do |name, age|
  name.capitalize
end
puts sorted_people
# => [[:john, 25], [:Kate, 27], [:Mike, 18]]

output =
books.sort_by do |book|
  book[:published]
end

puts output