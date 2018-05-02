# triangle_sides.rb

=begin
A triangle is classified as follows:

    equilateral All 3 sides are of equal length
    isosceles 2 sides are of equal length, while the 3rd is different
    scalene All 3 sides are of different length

To be a valid triangle, the sum of the lengths of the two shortest sides must
be greater than the length of the longest side, and all sides must have lengths
greater than 0: if either of these conditions is not satisfied, the triangle
is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments,
and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending
on whether the triangle is equilateral, isosceles, scalene, or invalid.
===========
i:  3 numbers (sides)
o: symbol (on of three or invalid)
r: valid = sum of 2 shortes > longest && all > 0
f: start by sorting sides by size
  - test for valid first
  - then test one by one
=end

def triangle(s1, s2, s3)
  arr = [s1] + [s2] + [s3]
  arr.sort!

  if arr[0] + arr[1] <= arr[2] || arr.any? {|n| n <= 0}
    return :invalid
  end

  if arr[0] == arr[1] && arr[1] == arr[2]
    return :equilateral
  end

  if arr[0] == arr[1] || arr[1] == arr[2]
    return :isosceles
  end

  if arr[0] != arr[1] && arr[1] != arr[2]
    return :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid

# ls solution
def triangle(side1, side2, side3)
  sides = [side1, side2, side3]
  largest_side = sides.max

  case
  when 2 * largest_side > sides.reduce(:+), sides.include?(0)
    :invalid
  when side1 == side2 && side2 == side3
    :equilateral
  when side1 == side2 || side1 == side3 || side2 == side3
    :isosceles
  else
    :scalene
  end
end
