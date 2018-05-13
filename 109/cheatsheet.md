# Explaining Code in Words

### a = 'hello'
On `line 1` of this code we are initializing the local variable `a` and
assigning a string object with value `hello` to it.

On `line 3` we are reassigning the local variable `a` to a different string
object with value `hello` .

### b = a
On `line 2` we are initializing the local variable `b` and assigning to
it a string object that the local variable `a` is referencing. Currently,
both of these local variables are pointing to the same object.

### def example(str)
On `line 1` we are defining the method `example` which takes 1 parameter. On
`line 10` we are calling the method `example` and passing in the string `hello`
as an argument to it.

### loop do
On `line 3` we are calling the method `loop` and passing in the `do..end` block
as an argument.
The output of de method `loop` will be ......
The `loop` method returns `nil` because the last evaluated statement in the loop
is `break` (implicit break which is `break nil`) and thus returns `nil`

### puts / p
On `line 6` we are calling the method `puts` and passing it local variable `a`
as an argument. `puts` will print the value of string object that `a` is
referencing, which is `5`. The return value of the `puts` will be `nil`

On `line 7` we are calling the method `puts` and passing it local variable `b`
as an argument. `puts` will try to print the value of string object that `b` is
referencing, but since `b` was initialized in the inner scope of the `loop`
method, `puts` can not access `b` and will throw an error.

The local variable `a` is passed to the method `p` as an argument.
`P` will output a string respresentation of `a` and return the value of `a`.

### i -= 1
On `line 5` the local variable `i` is reassigned to the return value of a
method call `Integer#-` on a local variable `i` with integer `1` passed to it as
an argument.

### break if i == 0
On `line 6` we are breaking out of the loop by using the keyword `break` if the
value of the object that local variable `i` is referencing is equal to 0.

### 2.times do |a|
On `line 3` we call the method `times` on the integer `2` and pass it
a end..do block as an argument with a parameter `a`. The block will be executed
2 times passing in a value of 0 to 'caller - 1' to the parameter `a`
(passing in 0 to 1). (variable shadowing: this `a` has nothing to do with
the outer scope `a`).

(??? this code? the block? the times?)
This code outputs the output of line 5 (`5`) two times
This code returns value of the object it was called on, `2` in this case.

### each
[1, 2, 3, 4].each { |num| puts num }
The `each` method is being called on an array.
Each element of the array is passed to the block in turn and assigned
to the local variable `num`.

The `puts `method then outputs a string representation of `num`.
`puts` returns `nil`. Since this is the last evaluated
statement within the block, the return value of the block is therefore
`nil`.

`each` doesn't do anything with the return value of the block, it
returns the original array - in this case `[1, 2, 3, 4]`

### map
[1, 2, 3, 4].map { |num| puts num }
The `map` method is being called on an array.
Each element of the array is passed to the block in turn and assigned
to the local variable `num`.

The `puts `method then outputs a string representation of `num`.
`puts` returns `nil`. Since this is the last evaluated
statement within the block, the return value of the block is therefore
`nil`.

`map` returns a new array based on the block’s return value. Each
element is transformed based on the return value.

Since the return value of the block is `nil`, `map` will return an
array with every orignal element transformed into `nil`
=> `[nil, nil, nil, nil]`

### select
[1, 2, 3, 4].select { |num| puts num }

The `select` method is being called on an array.
Each element of the array is passed to the block in turn and assigned
to the local variable `num`.

The `puts `method then outputs a string representation of `num`.
`puts` returns `nil`. Since this is the last evaluated
statement within the block, the return value of the block is therefore
`nil`.

`select` returns a new array based on the block’s return value.
If the return value evaluates to true (or: is truthy), then the element
is selected.

Since the return value of the block is `nil` (which evaluates to false)
for each passed in element, `select` will return an empty array.

# last evaluated
Since this is the last evaluated statement within the block, the return
value of the block is therefore `nil`.

Since this is the last evaluated statement within the method, the return
value of the method is therefore `nil`.

# method call
on line 12 we call the method `some_method` and pass it the local
variable `s` as an argument. This wills intialize the parameter in the
method `some_method` on line 5 and assign it to the value of variable `s`.

method definition:
```ruby
def some_method(parameter)
  # do some stuff
end
```
method invocation / call:
```ruby
some_method(argument)
```

# variable scope concepts
- outer scope variables can be accessed by inner scope
- inner scope variables cannot be accessed in outer scope
  unless:
  - outerscope can access changes maked by inner scope if the variable was
  intialized in outer scope.

- you can change variables from an inner scope and have that change affect
  the outer scope
- peer scopes do not conflict

## variable scope an blocks
- A block cannot access variables defined in a peer scope
- nested blocks:  blocks can be nested
  - scope can bleed through blocks from out to in
    – a variable initialised outside a block IS available inside the block
    – a variable initialised inside a block IS NOT avaialble outside the block
- variable shadowing: If a block takes a parameter, variable shadowing prevents
  access to variables of the same name outside the block
- A do/end pair that does not follow a method invocation does not constitute
  a block, so no nested scope is created

## variable scope and methods concepts
- a method definition can't access local variables in another scope
- a method definition can access objects passed in
- local variables defined outside of the method are not accessible from within
  the method, and local variables defined in the method are not acessible
  from outside the method
- A do/end pair that does not follow a method invocation does not constitute
  a block, so no nested scope is created
- The scoping rules for a `method invocation with a block` differ from the rules
  for method definitions. With method definitions, local variable scope is
  restricted to the method definition itself. In contrast, a method invocation
  with a block has more open scoping rules; the block can use and modify local
  variables that are defined outside the block.

# call by sharing concepts
- When an operation within the method mutates the caller, it will affect the
  original object (This is sometimes known as pass-by-reference-of-the-value
  or call-by-sharing)

# Collection concepts
- The `each` method doesn't do anything with the return value of the block, it
  returns the original array
- The `select` method returns a new array based on the block’s return value.
  If the return value evaluates to true (or: is truthy), then the element
  is selected.
- The `map` method returns a new array based on the block’s return value. Each
  element is transformed based on the return value.

# Nil and Truthy concepts
- `nil` and `false` evaluate to false
- Every Ruby expression that does not evaluate to either of the objects false
  or nil is `truthy`.

# sort_by
The `sort_by` method will return a new array based on and sorted by the last
evaluated statement of the block.

# #{} string interpolation
on line 8 the local variable `a` is interpolated into the string "before etc"
and passed to the `p` method as an argument

# variables as pointers.
Variables points to (references) an object that exists in a particular
location in memory. This location is reflected in an object’s object id,
which can be accessed with the Object#object_id method.

If a second variable is initialized to point to an existing variable,
that new variable will actually point to the same object as the first
variable points to, not to the first variable itself.

Through reassignment, you can change a variable to point to a new object
in a new location in memory. This leaves the original object unchanged, but it
is no longer accessible through the reassigned variable. Any other
variables that point to the old object may still access it as usual.

Through modification/mutation, you can keep a variable pointed to
the same space in memory, but modify the original object within that space.

If the variable points to an array, it points to the array object, not to
the values inside the array, those point themselves to objects.
```ruby
a = 2            # a is intialized and assigned object with value `2`
b = [5, 8]       # b is intialized and assigned and array object that points
                 # to two integer objects:  `[5, 8]`
arr = [a, b]     # [2, [5, 8]] points to an integer and an array object

arr[0] += 2      # reassigns to a different integer object [4, [5, 8]]
arr[1][0] -= a   # reassigns a value in the sub array to a different
                 # integer object and thus mutating the sub array object
                 # [2, [3, 8]]
a # => 2
b # => [3, 8]    # b is pointing to the same array object that was just
                 # mutated by arr[1][0] -= a
arr # => [4, [3, 8]]
a = b            # a is reassigned to the same object b is pointing to
a # => [3, 8]
b # => [3, 8]
```

# implicit return value of method invocations and blocks
Methods and blocks will return the return value of their last evaluated
statement.
```ruby
def some_method
  puts 'hello'
end
=> nill

def some_method
  p 'hello'
end
=> 'hello'

def some_method
  return 'goodbye'
  p 'hello'
end
# => 'goodbye'
```