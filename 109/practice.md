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
