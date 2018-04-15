# practice answers

### example 10
```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
```

In `line 1` the `Array#map` method is called on a multi-dimensional array. Each inner array
is passed in turn to the block as an argument and assigned to the local variable
`arr`.

In `line 2` the `Array#first` method is called on de variable `arr`.
This will return the first element of the subarray `arr`.(in this case `1` and
`3` respectively). This first element in its turn is passed to the `puts` method
which will output a string representation of the value of this element and
returns `nil`. Since this is the last evaluated statement in the block, the
block will return `nil`

`Array#map` returns a new array based on the block’s return value. Each
element is transformed based on the return value.

Since the return value of the block is `nil`, `Array#map` will return an
array with every orignal element transformed into `nil`

### example 11
```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
```
In `line 1` the  `Array#map` method is being called on an mulit-dimensional array.
Each element of the array is passed to the block in turn and assigned
to the local variable `arr`.

On `line 2` the `Array#first` method is called on the local variable `arr`.
This will return the first element of the subarray `arr` (`1` and `3` in this
case) and pass this as an agrument to the `puts` method

The `puts `method then outputs a string representation of `arr`.
`puts` returns `nil`.

On `line 3` he `Array#first` method is called on the local variable `arr`.
This will return the first element of the subarray `arr` (`1` and `3` in this
case). Since this is the last evaluated statement within the block, the return
value of the block is therefore the value of the first element of the
subarray `arr`.

`Array#map` returns a new array based on the block’s return value. Each
element is transformed based on the return value.

`Array#map` will return an array with every orignal element transformed into
the value of first element of the subarray:
=> `[1, 3]`

### example 12
```ruby
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
```

On `line 1` the `Array#each` method is being called on a multi-dimensional array.
Each element of the array is passed to the block in turn and assigned
to the local variable `arr`.
The return value of the block is assigned to the local variable `my_arr`

On `line 2` the `Array#each` method is being called on the local variable `arr`
([18, 7] and [3, 12] respectively).
Each element of the array is passed to the block in turn and assigned
to the local variable `num`.

On `line 3` the if statement evaluates if the comparison of the value of
the local variable `num` is greater then `5` evaluates to true or not.

If the if statement on line 3 evaluates to true:
On `line 4` the local variabel `num` is passed as an argument to the `puts` method.
The `puts `method then outputs a string representation of `num`.
`puts` returns `nil`. Since this is the last evaluated
statement within the if statement, the return value of the if statement is therefore
`nil`.

And since the if statement is the is the last evaluated
statement within the block, the return value of the block is therefore
`nil`.

the each statement in line 2 doesn't do anything with the return value of the block, it
returns the original array - in this case `([18, 7] and [3, 12] respectively)`

the each statement in line 1 also doesn't do anything with the return value of
the block, it returns the original array - in this case `[[18, 7], [3, 12]]`

So the code will output the values from the original array that are greater than
5 and will return the original array which is assigned to the local variable
`my_arr`


### example 13
```ruby
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
```

On line 1 the `Array#map` method is being called on an multi-dimensional array.
Each element of the array is passed to the block in turn and assigned
to the local variable `arr`. ([1, 2] and [3, 4])

On line 2 the `Array#map` method is being called on the local variable `arr`
Each element of the array is passed to the block in turn and assigned
to the local variable `num`.

On line 3 the Integer#* method is called on the variable `num` and passed the
value `2` as an argument. This will return the value of `num` multiplied by 2

`Array#map` returns a new array based on the block’s return value. Each
element is transformed based on the return value.
Since the last evaluated statement within the block, transforms the variable
num, a new array with the transformed values is returned to the map on line 2
([2, 4] and [6, 8])

The map on line 1 returns a new array based on the block’s return value. Each
element is transformed based on the return value. So it returns a new array
with the transformed values [[2,4],[6,8]]

in:
[[1, 2], [3, 4]].map do |arr|    # [1, 2] / [3, 4]
  arr.map do |num|               # 1 / 2 // 3 / 4
    num * 2
  end
end

out:
[[1, 2], [3, 4]].map do |arr|   # [[2,4],[6,8]]
  arr.map do |num|              # [2,4]  / [6,8]
    num * 2                     # 2 / 4 // 6 / 8
  end
end

### example 35
```ruby
def fix(value)
  value << 'xyz'
  value = value.upcase
  value.concat('!')
end
s = 'hello'
t = fix(s)
```

In line 6 we initialize the local variable `s` and assign it to a string object
with the value `hello`.
In line 7 we initialize the local variable `t` and assign it to the result of
the `fix` method while passing the local variabe `s` in as an argument

In line 1 we define the method `fix` with a parameter `value`.
In line 2 we modify the value the local variable 'value' is pointing to. The modified
value the local variable 'value' is pointing to will now be 'helloxyz'. Since we are
modifying this value the outer scope variabel `s` now also point to this modified
value.

In line 3 the method `upcase` is called on the local variable `value` and the result
of this ('HELLOXYZ') is assigned to the local variable `value`. So our local variable
`value` is reassigned and not mutated. This means that the local scope variable 's` still
points to the string object 'helloxyz'

In line 4 the mutating method String#concat is called on the local variable `value` and
passed '!' as an argument. This will change the value of the string object that
`value` is pointing to to 'HELLOXYZ!'
Since this is the last line of the method, it will be returned as the result of the
method and assiged to the local variabe `t` in line 7

End result: `s` points to a string variable with the value `helloxyz`
`t` points to a string variable with the value `helloxyz` 'HELLOXYZ!'

#### shorter version:
This is an example of:
A variable in a method mutating the caller
    (in line 2 the String#<< method mutates the local inner scope variable `value`
    that points to the  same string object as the outerscope variable `s`)
And after reassignment being mutated without mutating the caller.
    (in line 3 `value` is reassigned and then mutated in line `4` but since it was
     reassigned in line 3, it is no longer assigned to the same string object as
     the outerscope variable `s` and thus `s` is not impacted)

### example 27
def my_method(string)
  puts string
end
a = "hello"
my_method(a)

### example 31
2.times do
  a = 5
end
3.times do
  puts a
end
