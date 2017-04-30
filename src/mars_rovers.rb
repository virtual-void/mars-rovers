require_relative '../lib/mars_rovers/planet'
require_relative '../lib/mars_rovers/rover'
require_relative '../lib/mars_rovers/compass'
require_relative '../lib/mars_rovers/command_center'
require_relative '../lib/mars_rovers/control_api'
require_relative '../lib/mars_rovers/position'
require_relative '../lib/mars_rovers/errors'

#
# # interprets the NASA orders from a file
# #
#
# def initialize(orders)
# @orders = File.new(orders, 'r')
# @planet = nil
# end
#
# # retrieves the planet information
# def get_planet
# return @planet ||= @orders.readline.split(' ')
# end
#
# # retrives position and list of signals for next rover
# def next_rover_data
# unless self.eof?
# x, y, face = @orders.readline.split(' ')
# signals = @orders.readline.chomp.split('')
# return [x, y, face, signals]
# end
# end
#
# # checks if there are no more orders
# def eof?
# @orders.eof?
# end
#
module MarsRovers
  orders = File.new('./test_input.txt', 'r')

  planet ||= orders.readline.split(' ')

  planet = Planet.new(planet[0].to_i, planet[1].to_i)

  until orders.eof?
    x, y, direction = orders.readline.split(' ')
    commands = orders.readline.chomp.split('')

    rover = Rover.new.drop_on_planet(planet, x.to_i, y.to_i, direction)

    CommandCenter.send(commands.join, rover)

    puts rover

  end
end
