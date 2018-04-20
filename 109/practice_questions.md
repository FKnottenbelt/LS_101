#### example 1:
```ruby
a = 'hello'
b = a
a = 'goodbye'
```


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

#### example 6:
[1, 2, 3, 4].each { |num| puts num }

#### example 7:
[1, 2, 3, 4].map { |num| puts num }

#### example 8:
[1, 2, 3, 4].select { |num| puts num }

#### example 9:
```ruby
[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
```

### example 10
```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
```

### example 11
```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
```

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

### example 13
```ruby
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
```
### example 14
```ruby
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
```

### example 15
```ruby
arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]
arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end
```
### example 36
```ruby
[[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr|
  arr.select do |item|
    if item.to_s.to_i == item  # if integer [if item.class == Integer]
      item > 13
    else
      item.size < 6
    end
  end
end
```

### example 16
```ruby
[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end
```

### example 17
```ruby
[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end
```

### example 18
```ruby
def cap(str)
  str.capitalize!
end

name = "jim"
cap(name)
puts name
```
### example 19
```ruby
def cap(str)
  str.capitalize
end

name = "jim"
cap(name)
puts name
```

### example 20
```ruby
def add_name(arr, name)
  arr << name
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names.inspect
```
### example 21
```ruby
def add_name(arr, name)
  arr = arr + [name]
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names.inspect
```

### example 22
a = 5
loop do
  puts a
  break
end

### example 23
a = 5
loop do
  a = 4
  break
end
a

### example 24
loop do
  b = 5
  break
end
puts b

### example 25
b = nil
loop do
  b = 5
  break
end
puts b

### example 26
a = 5
def my_method(number)
  a = 4
end
my_method(10)
puts a

### example 27
def my_method(string)
  puts string
end
a = "hello"
my_method(a)

### example 28
def my_method
  number = yield
  puts number
end

a = 4
my_method { a }

### example 29
for i in (0..5) do
  a = 5
end
puts a

### example 30
loop do
  a = 5
  break
end
puts a

### example 31
2.times do
  a = 5
end
3.times do
  puts a
end

### example 32
a = 5
3.times do
  a = 3
end
5.times do
  puts a
end

### example 33
n = 4
[1, 2, 3].each { |n| n + 1 }

### example 34
n = 4
[1, 2, 3].each { |m| m + 1 }

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

### example 37 (36 is taken)
```ruby
a = [1, 3]
b = [4]
arr = [a, b]
a = b
p arr
p a
```

### example 38
```ruby
def replace_string(string)
  return string = "another string"
  string.replace "a third string"
end

s = "some string"
```

### example 39
```ruby
a = [1, 2, 3]

def mutate(array)
  array.pop
end

p "Before mutate method: #{a}"
p mutate(a)
p "After mutate method: #{a}"
```

### example 40
```ruby
if nil
  puts "some string"
end
```
### example 41
```ruby
a = false

if a
  puts "some other string"
```
