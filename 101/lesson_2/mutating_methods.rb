# mutating_methods.rb : Working through
# https://launchschool.com/blog/mutating-and-non-mutating-methods
print 'example 1: '
def fix(value)
  value.upcase!
  value.concat('!')
  value
end

s = 'hello'
t = fix(s)
puts s + ' ' + t
# => same object id, both HELLO!
###################
print 'example 2: '
def fix(value)
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)
puts s + ' ' + t
# => different object id, hello and HELLO!
################
print 'example 3: '
def fix(value)
  value << 'xyz'    # 4754640 stays same object id (mutate)
  value = value.upcase  # 4754340 here we change id (reassign) **
  value.concat('!')  # 4754340 we keep the new id (mutate)
end
s = 'hello'
s.object_id  # 4754640
t = fix(s)
puts s + ' ' + t
t.object_id # 9508681 = new
s.object_id  # 4754640 = original
# => different object id, helloxyz and HELLOXYZ!
# ** lesson: in line 29 we reassign to a different valued string
########################
print 'example 4: '
def fix(value)
   value = value.upcase! # 7524580 stays same, we mutate in place **
   value.concat('!') # 7524580
end
s = 'hello'
s.object_id # 7524580
t = fix(s)
t.object_id # 15049161
s.object_id # 7524580
puts s + ' ' + t
# => different object id, both HELLO!
# ** lesson: the 'value =' bit is redundant. We basically mutate in place
