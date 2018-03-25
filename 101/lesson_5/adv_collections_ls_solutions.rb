# LS solutions to Problems lesson 5 Advanced Collections

############
# problem_1
arr.sort do |a,b|
  b.to_i <=> a.to_i
end
# => ["11", "10", "9", "8", "7"]

############
# problem_2
books.sort_by do |book|
  book[:published]
end

############
# problem_3
arr1[2][1][3] # => "g"
arr2[1][:third][0] # => "g"
arr3[2][:third][0][0] # => "g"
hsh1['b'][1] # => "g"
hsh2[:third].key(0) # => "g" or:
hsh2[:third].keys[0] # => 'g'
# Hash#key returns a single key based on a value passed to the method.
# Hash#keys returns an array of all the keys in the hash, and the [0] is then
# referencing the object at index 0 of that returned array.

############
# problem_4
arr1[1][1] = 4
arr1 # => [1, [2, 4], 4]

arr2[2] = 4
arr2 # => [{:a=>1}, {:b=>2, :c=>[7, 6, 5], :d=>4}, 4]

hsh1[:first][2][0] = 4
hsh1 # => {:first=>[1, 2, [4]]}

hsh2[['a']][:a][2] = 4
hsh2 # => {["a"]=>{:a=>["1", :two, 4], :b=>4}, "b"=>5}

############
# problem_5
total_male_age = 0
munsters.each_value do |details|
  total_male_age += details["age"] if details["gender"] == "male"
end

total_male_age # => 444

############
# problem_6
munsters.each_pair do |name, details|
  puts "#{name} is a #{details['age']} year old #{details['gender']}"
end

############
# problem_7

a = 2
b = [5, 8]
arr = [a, b]  #[2,[5,8]]

arr[0] += 2 # [4,[5,8]]
arr[1][0] -= a #[4,[3,8]]

a # => 2
b # => [3, 8]

# The value of a didn't change because we are not referencing a at any point.
# This code arr[0] += 2 was modifying the array, arr not a. In effect we are
# assigning a new object at that index of the array so that instead of arr[0]
# containing a it now contains 4 - we can check this by looking at the value of arr:

arr # => [4, [3, 8]]

# The value of b did change because b is an array and we are modifying that array
# by assigning a new value at index 0 of that array.

############
# problem_8
vowels = 'aeiou'

hsh.each do |_, value|
  value.each do |str|
    str.chars.each do |char|
      puts char if vowels.include?(char)
    end
  end
end

############
# problem_9
# DESCENDING order!
arr.map do |sub_arr|
  sub_arr.sort do |a, b|
    b <=> a
  end
end
# => [["c", "b", "a"], [3, 2, 1], ["green", "blue", "black"]]

############
# problem_10
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  incremented_hash
end
# transforming a hash and giving back a hash (instead of an array) by
# making a new hash (INSIDE the map), looping (each) though hash and adding
# to new. after loop: GIVE BACK new to map

############
# problem_11
arr.map do |element|
  element.select do |num|
    num % 3 == 0
  end
end
# => [[], [3], [9], [15]]

############
# problem_12

hsh = {}
arr.each do |item|
  hsh[item[0]] = item[1]
end
# => {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

############
# problem_13
arr.sort_by do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end
end

# aant:
# sort: sort{|a,b| block} -> array
(1..10).sort { |a, b| b <=> a }
# sort_by: sort_by { |obj| block} -> array
%w{apple pear fig}.sort_by { |word| word.length }

############
# problem_14

hsh.map do |_, value|
  if value[:type] == 'fruit'
    value[:colors].map do |color|
      color.capitalize
    end
  elsif value[:type] == 'vegetable'
    value[:size].upcase
  end
end

############
# problem_15

arr.select do |hsh|
  hsh.all? do |_, value|
    value.all? do |num|
      num.even?
    end
  end
end

############
# problem_16

def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end


