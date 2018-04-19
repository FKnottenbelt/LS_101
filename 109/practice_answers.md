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

- When an operation within the method mutates the caller, it will affect the
  original object (This is sometimes known as pass-by-reference-of-the-value
  or call-by-sharing)
- `<<` and `.concat` are mutating
- `=` reassignment and `.upcase` are not mutating

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

### example 22
a = 5
loop do
  puts a
  break
end

- outer scope variables can be accessed by inner scope

In `line 1` we intialize the local variable `a` and assign it to an integer
object with the value `5`

In `line 2` we call the `loop` method and pass it a block as an argument.
In the block we call the method `puts` and pass it the local variable `a` as
and argument. `puts` outputs a string representation `a` so wil output '5' and
return nil. (inner scope in block can access outer scope variable)

in `line 5` we call the keyword `break`. This will break out of the loop and
return nil as the block result, so the `loop` method will return `nil`

### example 23
a = 5
loop do
  a = 4
  break
end
a

- outer scope variables can be accessed by inner scope
- you can change variables from an inner scope and have that change affect
  the outer scope
- outerscope can access changes make by inner scope if the variable was
  intialized in outer scope.

In `line 1` we intialize the local variable `a` and assign it to an integer
object with the value `5`

In `line 2` we call the `loop` method and pass it a block as an argument.
In the block we reassign the local variable `a` to an object with the value
`4` (inner scope in block can access outer scope variable)

in `lline 5` we call the keyword `break`. This will break out of the loop and
return nil as the block result, so the `loop` method will return `nil`

in `line 6` the local variable `a` will point to the value `4` since this
outerscope variable got reassigned in line `3`

"This example demonstrates two things. The first is that inner scope can access
outer scope variables. The second, and less intuitive, concept is that you can
change variables from an inner scope and have that change affect the outer scope"

"outer scope variables can be accessed by inner scope"

### example 24
loop do
  b = 5
  break
end
puts b

In `line 1` we pass a block to the `loop` method. In the inner scope created
by the block we intialize the local variable `b` and assign it an object with
the value `5`.

in `line 3` we call the keyword `break`. This will break out of the loop and
return nil as the block result, so the `loop` method will return `nil`

In `line 5` we pass the local variable `b` to the `puts` method as an
argument. Puts will try to output a string representation of the variable `b`
but wil be unable to access a variable initialized by the inner scope made
by the block and will throw an error message

"inner scope variables cannot be accessed in outer scope"

### example 25
b = nil
loop do
  b = 5
  break
end
puts b

In `line 1` the local variable `b` is initialized and assigned to `nil`

In `line 2` we pass a block to the method `loop` as an argument.
In the block we reassign the variable `b` to an object with the value `5`
(outer scope variables can be accessed by inner scope). The block will output
nothing and return the last evaluated statement which will return `5`

In line 6 we pass the local variabele `b` to the `puts` method as an argument
Puts will output a string representation of the variable `b` and return nil

- you can change variables from an inner scope and have that change affect
  the outer scope
- outerscope can access changes make by inner scope if the variable was
  intialized in outer scope.

### example 26
a = 5
def my_method(number)
  a = 4
end
my_method(10)
puts a

- inner scope variables cannot be accessed in outer scope
- a method definition can't access local variables in another scope

In `line 1` we intialize local variable `a` and assign to an object with the
value of `5`.

In `line 2` we define a method `my_method` with the variable `number` as a
parameter.

In `line 5` we call the method `my_method` and pass it the value `10` as
an argument. Nothing is done with this argument.

In the method de local variabe `a` is intialized and assigned a value
of `4`. This is a completely different variable than the one in the ouder scope

The method outputs nothing and returns `4`.
SO the call to the method (line 5) returns this `4`

In line 6 the local variable `a` is passed as an argument to the `puts` method
Since the only variable `a` that is available here is the one from line 1,
puts will output `5` and return nil.

### example 27
def my_method(string)
  puts string
end
a = "hello"
my_method(a)

- a method definition can access objects passed in

in line 4 the local variable `a` is intialized and assigned to an object
with the value  `hello`

In line 5 the method `my_method` is called and is passed the local variable
`a` as an argument

In line 1 the method `my_method` is defined with the variable `string` as
an parameter. the call in line 5 passes `a` to the method. `a` is assigned to
`string`.

on line 2 the variable `string` is passed to the method `puts` as an argument
. puts outputs 'hello' and returns nil

the methods returns nil, so the call to my_method returns nil


### example 28
def my_method
  number = yield
  puts number
end

a = 4
my_method { a }

- a method definition can access objects passed in
- 
On line 5 the local variable `a` is intialized and assigned the value `4`
This variable is then in a block passed as an argument to the method `my_method`
(line 6)

In line 1 the method `my_method` is defined
On line 2 the local variable `number` is initialized and assigned to the
return value of the `yield` keyword. The yield keyword causes the control
to go to the block if one was passed in to the method as an argument.
In this case that was done on line 6. The block will return the value of `a`,
which is `4`. So the yield will return `4` and `4` will be assigned to
`number`

On line 3 the variable `number` is passed to the `puts` method as an argument
puts will print a string representation of `number` ('4') and will return nil
The method will thus ouput `4` and return nil


### example 29
for i in (0..5) do
  a = 5
end
puts a

- A do/end pair that does not follow a method invocation does not constitute
  a block, so no nested scope is created

in line 1 a `for` loop iterates from 0 to 5. Inside the for loop the local
variable `a` is initialized and assigned the value `5`. The for loop has no
output and will return the range it iterated over (0..5)

In line 4 the local variable `a` is passed as an argument to the method
puts. Puts will output a string representation of the value `a` is pointing to,
which is `5` and will return nil Puts can acces `a` becasue the for loop does
not make an inner scope.

### example 31
2.times do
  a = 5
end
3.times do
  puts a
end


- A block cannot access variables defined in a peer scope

On line 1 the times method is called on the integer `2` and is passed a block
as an argument. In the inner scope of the block the local variable `a` is
intialized. The method runs twice, outputs nothing and returns the original
integer `2`

On line 4 the times method is called on the integer `3` and is passed a block
as an argument. In the inner scope of the block the local variable `a` is
passed as an argument to the puts method. However, since the variable is not
intialized in this scope and the block can not access a peer scope,
an error is thrown.


### example 32
a = 5
3.times do
  a = 3
end
5.times do
  puts a
end

- outer scope variables can be accessed by inner scope
- outerscope can access changes make by inner scope if the variable was
  intialized in outer scope.

### example 33
n = 4
[1, 2, 3].each { |n| n + 1 }

- variable shadowing: If a block takes a parameter, variable shadowing prevents
  access to variables of the same name outside the block

on line 1 the local variable `n` is intialized and assigned the value `4`

On line 2 the `Array#each` method is being called on an array.
Each element of the array is passed to the block in turn and assigned
to the local variable `n`.

In the block the `+` method is called on the the variable `n` with an
argument with the value `1` passed to it. The method, and thus the block
will return n+1 (2,3,4 respectively) and output nothing

`Array#each` doesn't do anything with the return value of the block, it
returns the original array - in this case `[1, 2, 3]`

### example 34
n = 4
[1, 2, 3].each { |m| m + 1 ; puts n }

on line 1 the local variable `n` is intialized and assigned the value `4`

On line 2 the `Array#each` method is being called on an array.
Each element of the array is passed to the block in turn and assigned
to the local variable `m`.

In the block the `+` method is called on the the variable `m` with an
argument with the value `1` passed to it. The method, and thus the block
will return n+1 (2,3,4 respectively) and output nothing
