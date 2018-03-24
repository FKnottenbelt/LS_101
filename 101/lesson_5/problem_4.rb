# problem_4.rb
# For each of these collection objects where the value 3 occurs,
# demonstrate how you would change this to 4.

arr1 = [1, [2, 3], 4]

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

hsh1 = {first: [1, 2, [3]]}

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

### A:
arr1[1][1] = 4
p arr1

arr2[2] = 4
p arr2

hsh1[:first][2] = [4]  # or: hsh1[:first][2][0] = 4
p hsh1
# but hsh1[:first][2] = [4] replaces the whole sub array, while
# hsh1[:first][2][0] = 4 just replaces the value

hsh2[['a']][:a][2] = 4
p hsh2
