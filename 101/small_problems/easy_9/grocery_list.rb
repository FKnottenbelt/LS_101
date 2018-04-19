# grocery_list.rb

# Write a method which takes a grocery list (array) of fruits with quantities
# and converts it into an array of the correct number of each fruit.

# i: array: fruit, quantities
# o: array fruit times quantities
# f: transform subarray in fruit times quantities
#   flatten

def buy_fruit(groceries)
  grocery_list = []
  groceries.each do |item|
    item[1].times {grocery_list << item[0] }
  end
  grocery_list.flatten
end

def buy_fruit(groceries)
  groceries.map do |item|
    [item[0]] * item[1]
  end.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]])  ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

# ls solution
def buy_fruit(list)
  list.map { |fruit, quantity| [fruit] * quantity }.flatten
end

