# problem_16.rb

# A UUID is a type of identifier often used as a way to uniquely identify
# items...which may not all be created by the same system. That is, without
# any form of synchronization, two or more separate computer systems can
# create new items and label them with a UUID with no significant chance of
# stepping on each other's toes.

# It accomplishes this feat through massive randomization. The number of
# possible UUID values is approximately 3.4 X 10E38.

# Each UUID consists of 32 hexadecimal characters, and is typically broken
# into 5 sections like this 8-4-4-4-12 and represented as a string.

# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# Write a method that returns one UUID when called with no parameters.

def make_uuid()
  options = []
  (0..9).each { |n| options << n.to_s }
  ('a'..'f').each { |l| options << l }

  sections_size = [8, 4, 4, 4, 12]
  uuid = ''
  sections_size.each do |size|
    size.times do |_|
      uuid << options.sample
    end
    uuid << "-"
  end
  uuid.chop
end

p make_uuid

# option 2
=begin
i: nothing
o: 8-4-4-4-12 random hex
f: make random section of x size
    - two ranges 0-9 and a-f, add them together
    - now do x time sample and ouput as string

   call make(8), add to ouput
   call make(4) etc
=end

def make_section(size)
  range = ((0..9).to_a << ('a'..'f').to_a).flatten
  counter = 1
  section = ''

  loop do
    break if counter > size
    section << range.sample.to_s
    counter += 1
  end

  section
end

def make_uuid()
  output =[]
  [8,4, 4, 4, 12].each do |size|
    output << make_section(size)
  end
  output.join('-')
end

p make_uuid()

# alternative
def section(len)
  section = ''
  len.times do
    section << (('0'..'9').to_a + ('a'..'f').to_a).sample
  end
  section
end

def uid()
  arr = [8,4,4,4,12]
  arr.map do |len|
    section(len)
  end.join('-')
end

p uid
# ls solution
def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end
