module MarsRovers
  class ControlApi
    CONTROL_UNIT_API = %w[L R M].freeze

    def initialize(rover)
      @rover = rover
    end

    def interpret(command)
      raise CommandNotSupportedError unless CONTROL_UNIT_API.include?(command)

      case command
      when 'L' then
        turn_left
      when 'R' then
        turn_right
      when 'M' then
        move
      end
    end

    private

    def turn_left
      @rover.direction = @rover.direction.left
    end

    def turn_right
      @rover.direction = @rover.direction.right
    end

    def move
      @rover.position = @rover.direction.forward(@rover.position)
    end
  end
end
