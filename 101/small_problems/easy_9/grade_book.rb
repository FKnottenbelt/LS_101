# grade_book.rb

# Write a method that determines the mean (average) of the three scores passed
# to it, and returns the letter value associated with that grade.
# Numerical Score Letter 	Grade
# 90 <= score <= 100 	'A'
# 80 <= score < 90 	'B'
# 70 <= score < 80 	'C'
# 60 <= score < 70 	'D'
# 0 <= score < 60 	'F'

# Tested values are all between 0 and 100. There is no need to check for
# negative values or values greater than 100.

# I: 3 grades (numbers)
# o: average of grades translated to letter grade
# D: lookup => hash
# f: add grades, divide by 3
#   look letter up in table,
#   return letter

LOOKUP = { 'A' => [90, 100], 'B' => [80, 90] , 'C' => [70, 80],
           'D' => [60, 70], 'F' => [0, 60] }

def get_grade(score1, score2, score3)
  average = (score1 + score2 + score3) /3
  LOOKUP.each do |grade, range|
    return grade if (range[0] <= average && average <= range[1])
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"

# ls solution
def get_grade(s1, s2, s3)
  result = (s1 + s2 + s3)/3

  case result
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
end

# Further exploration

# How would you handle this if there was a possibility of extra credit grades
# causing it to exceed 100 points?
