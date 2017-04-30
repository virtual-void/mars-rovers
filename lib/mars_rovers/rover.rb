require 'observer'

module MarsRovers
  class Rover
    attr_accessor :direction, :position

    include Observable

    def initialize
      @position = Compass::Position.new(0, 0)
      @direction = Compass::NORTH
      @control_unit = ControlApi.new(self)
    end

    def drop_on_planet(planet, x, y, direction)
      @position = Compass::Position.new(x, y)
      @direction = Compass.get_direction_by_name(direction)

      add_observer(planet)
      changed; notify_observers(self)

      self
    end

    def receive_command(command)
      @control_unit.interpret(command)
      changed; notify_observers(self)
    end

    def to_s
      "#{position} #{direction}"
    end
  end
end
