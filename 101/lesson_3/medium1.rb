def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(buffer, max_buffer_size, new_element)
  buffer = buffer + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

buffermain = [1,2,3,4]
p buffermain.object_id
p rolling_buffer1(buffermain,4,5) # [2,3,4,5]
p buffermain
p buffermain.object_id
puts '--------------'
buffermain = [1,2,3,4]
p buffermain.object_id
p rolling_buffer2(buffermain,4,5)
p buffermain
p buffermain.object_id