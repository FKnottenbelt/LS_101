# Explaining Code in Words
using [Srdjan's post](https://medium.com/how-i-started-learning-coding-from-scratch/advice-for-109-written-assessment-part-2-594060594f6e)

## General
20 questions, 3 hours (9 minutes per question.) Lot's of explaining code so
typing a LOT.

Use backticks for:
- method names `greetings`
- variable names `name`
- code lines you are referring to `line 1`

use paragraphs

When evaluating code like this, ask the following questions:
•	What is the type of action being performed (method call, block,
  conditional, etc..)?
•	What is the object that action is being performed on?
•	What is the side-effect of that action (e.g. output or destructive action)?
•	What is the return value of that action?
•	Is the return value used by whatever instigated the action?


## Variable Words: initialized, assign, referencing, reassign
- a variable is `initialized`
- you `assign` a *string* object with the value 'x' to a *local* variable
- a variable is `referencing` a *string* object with the value 'x'
- your `reassign` a *local* variable *a* to a different *string* object with the
value 'y'

#### example 1:

```ruby
a = 'hello'
b = a
a = 'goodbye'
```

On `line 1` of this code we are initializing the local variable `a` and
assigning a string object with value `hello` to it.

On `line 2` we are initializing the local variable `b` and assigning to
it a string object that the local variable `a` is referencing. Currently,
both of these local variables are pointing to the same object.

On `line 3` we are reassigning the local variable `a` to a different string
object with value `goodbye` so now, the local variable `a` is pointing to one
string object with value `goodbye` and the local variable `b` is pointing to
a string object with value `hello`.

## Method Words: defining, parameter, call, pass in, argument, return value
- a method is `defined`
- a method takes a `parameter`
- a method is `called`
- an object is `passed in to` a method as an `argument`
  (Methods are defined with parameters, but they are called with arguments)
- a variable can be `assigned to the return value of a method call` (so a
 method has a `return value`)
- a method is `called on` a variabele

- `loop` is method of `Kernel` class and returns `nil` or whatever the
 expression after the loop returns.
- a `do..end block` is passed as an `argument` to a `method call`
- You are going to use a lot of `passing in as an argument` on the test.
  Get used to that phrase.
- As of Ruby 2.4, the `Fixnum` and Bignum classes are gone, there is only
  `Integer`
- End by giving `output` and `return value`

#### example 2:

```ruby
def example(str)
  i = 3
  loop do
    puts str
    i -= 1
    break if i == 0
  end
end

example('hello')
```

On `line 1` we are defining the method `example` which takes 1 parameter. On
`line 10` we are calling the method `example` and passing in the string `hello`
as an argument to it.

On `line 2` of this code we are initializing the local variable `i` and assigning
to it an integer with value `3`

On `line 3` we are calling the method `loop` and passing in the `do..end` block
as an argument.

On `line 4` we are calling the method `puts` and passing in local variable `str`
to it as an argument.

On `line 5` the local variable `i` is reassigned to the return value of a
method call `Integer#-` on a local variable `i` with integer `1` passed to it as
an argument.

On `line 6` we are breaking out of the loop by using the keyword `break` if the
value of the object that local variable `i` is referencing is equal to 0.

On `line 10` we are calling the method `example` and passing in string `hello` as
an argument.

This code outputs string `hello` 3 times and returns `nil`.

Because (don't know if you have to give this part too):
We are calling the `puts` method inside of our method definition, and the last
line of code that is executed is returned since we don’t have an explicit
return inside of the method definition. The method `puts` is outputting values
of objects, strings, integers and so on, so our method call on `line 10`
outputs the string `hello` 3 times, but returns `nil` since the last line of the
code in example method that is evaluated returns `nil`.

should be ???:
Because the last evaluated statement in the loop is `break` (implicit
break which is `break nil`) and thus returns `nil`

## variable scope examples:

#### example 3:
```ruby
a = 4

loop do
  a = 5
  b = 3
  break
end

puts a
puts b
```

On `line 1` the local variable `a` is intialized and assigned an integer object
with the value `4`

On `line 2` we call the method `loop` and pass it a `do..end` block as an
argument.

On `line 3` the local variable `a` is reassigned to an integer object
with the value `5`

On `line 4` the local variable `b` is intialized and assigned an integer object
with the value `3` (inner scope)

On `line 5` we are breaking out of the loop by calling the keyword `break`.

On `line 6` we are calling the method `puts` and passing it local variable `a`
as an argument. `puts` will print the value of string object that `a` is
referencing, which is `5`. The return value of the `puts` will be `nil`

On `line 7` we are calling the method `puts` and passing it local variable `b`
as an argument. `puts` will try to print the value of string object that `b` is
referencing, but since `b` was initialized in the inner scope of the `loop`
method, `puts` can not access `b` and will throw an error.

#### example 4:
```ruby
a = 4
b = 2

loop do
  c = 3
  a = c
  break
end

puts a
puts b
```

On `line 1` the local variable `a` is intialized an assingend an integer object
with the value of `4`

On `line 1` the local variable `b` is intialized an assingend an integer object
with the value of `2`

On `line 3` we call the method `loop`  and pass it an `do..end` block as
an argument.

On `line 4` the local variable `c` is intialized an assigned an integer object
with the value of `3`. (inner scope)

On `line 5` the local variable `a` is reassigned to an object that
the local variable `c` is referencing. Currently, both of these local
variables are pointing to the same object.
(inner scope can access variables from outer scope)

On `line 6` we break out of the loop by calling the keyword `break`. Which
will retrun `nil` and thus the method `loop` will return `nil`

On `line 7` we are calling the method `puts` and passing it the variabele `a`
as an argument. `puts` will print the value of the object that `a` is
referencing which is `3`. The return value of `puts` is nil.

On `line 8` we are calling the method `puts` and passing it the variabele `b`
as an argument. `puts` will print the value of the object that `b` is
referencing which is `2`. The return value of `puts` is nil.

#### example 5:

```ruby
a = 4
b = 2

2.times do |a|
  a = 5
  puts a
end

puts a
puts b
```

On `line 1` we are intializing a local variable `a` to reference an
integer object with the value `4`

On `line 2` we are intializing a local variable `b` to reference an
integer object with the value `2`

On `line 3` we call the method `times` on the integer `2` and pass it
a end..do block as an argument with a parameter `a`.
(variable shadowing: this `a` has nothing to do with the outer scope `a`).

(??? this code? the block? the times?)
This code outputs the output of line 5 (`5`) two times
This code returns value of the object it was called on, `2` in this case.

On `line 4` we assign the value of `5` to the local variable `a` passed
in as a parameter to the do..end block.

On `line 5` we are calling the `puts` method and passing it the local
variabe `a` as an argument. `puts` will print the value of `a` which is
`5` and return `nil`

On `line 6` we are calling the `puts` method and passing it the local
variabe `a` (outer scope) as an argument. `puts` will print the value
of `a` which is `4` and return `nil`.

On `line 7` we are calling the `puts` method and passing it the local
variabe `b` (outer scope) as an argument. `puts` will print the value
of `b` which is `2` and return `nil`.

## Collection words:


#### example 6:
[1, 2, 3, 4].each { |num| puts num }

The Array#each method is being called on an array.
Each element of the array is passed to the block in turn and assigned
to the local variable `num`.

The `puts `method then outputs a string representation of `num`.
`puts` returns `nil`. Since this is the last evaluated
statement within the block, the return value of the block is therefore
`nil`.

Array#each doesn't do anything with the return value of the block, it
returns the original array - in this case `[1, 2, 3, 4]`

#### example 7:
[1, 2, 3, 4].map { |num| puts num }

The Array#map method is being called on an array.
Each element of the array is passed to the block in turn and assigned
to the local variable `num`.

The `puts `method then outputs a string representation of `num`.
`puts` returns `nil`. Since this is the last evaluated
statement within the block, the return value of the block is therefore
`nil`.

Array#map returns a new array based on the block’s return value. Each
element is transformed based on the return value.

Since the return value of the block is `nil`, Array#map will return an
array with every orignal element transformed into `nil`
=> `[nil, nil, nil, nil]`

#### example 8:
[1, 2, 3, 4].select { |num| puts num }

The Array#select method is being called on an array.
Each element of the array is passed to the block in turn and assigned
to the local variable `num`.

The `puts `method then outputs a string representation of `num`.
`puts` returns `nil`. Since this is the last evaluated
statement within the block, the return value of the block is therefore
`nil`.

Array#select returns a new array based on the block’s return value.
If the return value evaluates to true (or: is truthy), then the element
is selected.

Since the return value of the block is `nil` (which evaluates to false)
for each passed in element, Array#select will return an empty array.

#### example 9:
```ruby
[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
```

The `Array#each` method is being called on the multi-dimensional array
`[[1, 2], [3, 4]]`. Each inner array is passed to the block in turn and
assigned to the local variable `arr`.

The `Array#first` method is calledon `arr` and returns the object at
`index 0` of the current array - in this case the integers `1` and `3`,
respectively.

The `puts` method then outputs a string representation of the integer.
`puts` returns `nil` and, since this is the last evaluated statement
within the block, the return value of the block is therefore `nil`.

`each` doesn't do anything with this returned value though, and since
the return value of each is the calling object - in this case the
nested array `[[1, 2], [3, 4]]` - this is what is ultimately returned


