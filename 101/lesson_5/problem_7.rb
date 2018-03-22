# problem_8

# Given this code, what would be the final values of a and b? Try to work this
# out without running the code.

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

p a
p b
p arr
## A:
# arr[0] is 2 => 2 += 2 => 4 gets reassigned to 4
# a = 2 (does not change)
# arr[1][0] is 5 => 5 - 2 = 3  but reassigning the b, we are changing the array
# in b
# b = [3, 8]
# arr = [4, [3,8]]
