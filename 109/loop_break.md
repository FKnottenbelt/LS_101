# The return value of loops: whatever is after the break.
Loops themselves return nil as a result (implicit break which is break nil)
unless you use explicit break "something". If you want to assign result of
the loop you should use break for this: x = loop do break 1; end

And from rubydocs `keyword break`: (https://ruby-doc.org/docs/keywords/1.9/)
Causes unconditional termination of a code block or while or until block,
with control transfered to the line after the block. If given an argument,
returns that argument as the value of the terminated block.

```ruby
loop do
  a = 1
  break
end

# => nil
```

```ruby
loop do
  a = 1
  break 2
end

# => 2
```

```ruby
loop do
  a = 1
  break if a == 1
end

# => nil
# because if a == 1 (end) returns nil
# trying to get the if to return something else doesn't work
```

```ruby
loop do
  a = 10
  puts a
  break a
end

# 10
# => 10
```
