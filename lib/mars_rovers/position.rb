module Compass
  class Position
    attr_accessor :x, :y

    def initialize(x, y)
      @x = x
      @y = y
    end

    def add(position)
      @x = @x + position.x
      @y = @y + position.y
      self
    end

    def to_s
      "#{@x},#{@y}"
    end
  end

  TO_NORTH = Position.new(0, 1)
  TO_WEST = Position.new(-1, 0)
  TO_EAST = Position.new(1, 0)
  TO_SOUTH = Position.new(0, -1)

end