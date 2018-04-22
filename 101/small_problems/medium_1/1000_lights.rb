# 1000_lights.rb

# You have a bank of switches before you, numbered from 1 to n. Each switch is
# connected to exactly one light that is initially off. You walk down the row
# of switches and toggle every one of them. You go back to the beginning, and
# on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass,
# you go back again to the beginning and toggle switches 3, 6, 9, and so on. You
# repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, and
# returns an Array that identifies which lights are on after n repetitions.

# Example with n = 5 lights:

#     round 1: every light is turned on
#     round 2: lights 2 and 4 are now off; 1, 3, 5 are on
#     round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
#     round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
#     round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

# The result is that 2 lights are left on, lights 1 and 4.
# The return value is [1, 4].

# With 10 lights, 3 lights are left on: lights 1, 4, and 9.
# The return value is [1, 4, 9].

=begin
i: number of switches (n)
o: array showing which lights are on.
f: - make N lights: array of n elements with value 'on'
   - determine startvalue for the round: counter starting at 2

   - starting at light with value counter (index counter-1),
     toggle counter, counter * 2, counter * 3
     until counter * result value > arr.size
     - determine light to toggle
   - then add 1 to counter
      and do again
      until counter is > arr.size

   - select all index + 1's that are 'on' from the array and
   return in array

=end

def toggle(lights, lightnum)
  index = lightnum - 1
  lights[index] == 'on' ? lights[index] ='off' : lights[index] = 'on'
  lights
end


def switches(lights)
  arr = ['on'] * lights
  counter = 2
  upgrade = 1
  loop do
    break if counter > lights

    loop do
      break if (counter * upgrade) > lights
      lightnum = counter * upgrade
      arr = toggle(arr, lightnum)
      upgrade += 1
    end

    counter += 1
    upgrade = 1
  end

  output = []
  arr.each_with_index do |light, index|
    if light == "on"
      output << index + 1
    end
  end
  output
end

p switches(5) == [1,4]
p switches(10) == [1,4,9]

###############
# LS solution
# initialize the lights hash
def initialize_lights(number_of_lights)
  lights = Hash.new
  1.upto(number_of_lights) { |number| lights[number] = "off" }
  lights
end

# return list of light numbers that are on
def on_lights(lights)
  lights.select { |position, state| state == "on" }.keys
end

# toggle every nth light in lights hash
def toggle_every_nth_light(lights, nth)
  lights.each do |position, state|
    if position % nth == 0
      lights[position] = (state == "off") ? "on" : "off"
    end
  end
end

# Run entire program for number of lights
def toggle_lights(number_of_lights)
  lights = initialize_lights(number_of_lights)
  1.upto(lights.size) do |iteration_number|
    toggle_every_nth_light(lights, iteration_number)
  end

  on_lights(lights)
end

p toggle_lights(1000)