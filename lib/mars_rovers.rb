require_relative '../lib/mars_rovers/planet'
require_relative '../lib/mars_rovers/rover'
require_relative '../lib/mars_rovers/compass'
require_relative '../lib/mars_rovers/command_center'
require_relative '../lib/mars_rovers/control_api'
require_relative '../lib/mars_rovers/position'
require_relative '../lib/mars_rovers/command_not_supported_error'
require_relative '../lib/mars_rovers/out_of_planet_error'

module MarsRovers
  planet = Planet.new(5, 5)

  rover1 = Rover.new.drop_on_planet(planet, Compass::Position.new(1, 2), Compass.get_direction_by_name('N'))
  rover2 = Rover.new.drop_on_planet(planet, Compass::Position.new(3, 3), Compass.get_direction_by_name('E'))

  CommandCenter.send('LMLMLMLMM', rover1)
  CommandCenter.send('MMRMMRMRRM', rover2)

  puts rover1
  puts rover2
end
