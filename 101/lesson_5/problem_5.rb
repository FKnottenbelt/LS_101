# problem_5.rb

# Given this nested Hash:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# figure out the total age of just the male members of the family

# option 1
males = munsters.select { |name, details| details['gender'] == 'male' }
ages = males.map { |name, details| details['age'] }
total = ages.reduce(:+)

p total

# option 2
total = 0
munsters.each_value do |details|
  total += details['age'] if details['gender'] == 'male'
end
p total
