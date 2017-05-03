require_relative '../lib/mars_rovers/planet'
require_relative '../lib/mars_rovers/rover'
require_relative '../lib/mars_rovers/compass'
require_relative '../lib/mars_rovers/command_center'
require_relative '../lib/mars_rovers/control_api'
require_relative '../lib/mars_rovers/position'
require_relative '../lib/mars_rovers/errors'

module MarsRovers
  orders = File.new('./test_input.txt', 'r')

  planet ||= orders.readline.split(' ')

  planet = Planet.new(planet[0].to_i, planet[1].to_i)

  until orders.eof?
    x, y, direction = orders.readline.split(' ')
    commands = orders.readline.chomp.split('')

    rover = Rover.new.drop_on_planet(planet, x.to_i, y.to_i, direction)

    CommandCenter.receive_commands(commands.join, rover)

    puts rover

  end
end
