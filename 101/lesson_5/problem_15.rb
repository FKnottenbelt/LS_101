# problem_15.rb

# Given this data structure write some code to return an array which contains
# only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

# option 1
out=
arr.map do |hash|   # {b: [2, 4, 6], c: [3, 6], d: [4]}

    evens = hash.map do |key, values|  # b: [2, 4, 6]  alles true?
      values.all? { |int| int.even? } # [2, 4, 6]  true or false
    end  # [[false], [true, false, true], [true, true]]

    hash if evens.all?
end.compact

p out

# option 2
out =
arr.select do |hash|
  hash.values.flatten.all? { |int| int.even?}
end

p out

# LS solution
arr.select do |hsh|
  hsh.all? do |_, value|
    value.all? do |num|
      num.even?
    end
  end
end
