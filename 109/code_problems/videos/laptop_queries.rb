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

query = {
  price_min: 240,
  price_max: 280,
  q: 'thinkpad'
}

query2 = {
  price_min: 300,
  price_max: 450,
  q: 'dell'
}

=begin
i: hash
o: subset of PRODUCTS (array with hashes)
f: - loop through product to get at hashes
    - get the values of the hash
       - select where name.downcase = q
       - and price between price_min and price_max
=end

def search(query)
  PRODUCTS.select do |hash|
    hash.values[0].downcase.include?(query[:q]) &&
    hash.values[1].between?(query[:price_min], query[:price_max])
  end
end

p search(query)
# [ { name: "Thinkpad x220" , price: 250 } ]

p search(query2)
# [ { name: "Dell Inspiron" , price: 300 },
#   { name: "Dell Inspiron" , price: 450 }]


