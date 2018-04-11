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

### example 9a
```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
```

### example 9b
```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
```

### example 9c
```ruby
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
```

### example 9d
```ruby
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
```
### example 9e
```ruby
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
```

### example 9f
```ruby
arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]
arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end
```
### example 9g
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

### example 9h
```ruby
[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end
```

### example 9i
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

### example 10
```ruby
def cap(str)
  str.capitalize!

name = "jim"
cap(name)
puts name
```
### example 10a
```ruby
def cap(str)
  str.capitalize
end

name = "jim"
cap(name)
puts name
```

### example 10b
```ruby
def add_name(arr, name)
  arr << name
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names.inspect
```
### example 10c
```ruby
def add_name(arr, name)
  arr = arr + [name]
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names.inspect
```