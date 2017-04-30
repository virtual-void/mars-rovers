module Compass
  class North
    def left
      WEST
    end

    def right
      EAST
    end

    def forward(position)
      position.add(TO_NORTH)
    end

    def to_s
      'N'
    end
  end

  class East
    def left
      NORTH
    end

    def right
      SOUTH
    end

    def forward(position)
      position.add(TO_EAST)
    end

    def to_s
      'E'
    end
  end

  class West
    def left
      SOUTH
    end

    def right
      NORTH
    end

    def forward(position)
      position.add(TO_WEST)
    end

    def to_s
      'W'
    end
  end

  class South
    def left
      EAST
    end

    def right
      WEST
    end

    def forward(position)
      position.add(TO_SOUTH)
    end

    def to_s
      'S'
    end
  end

  NORTH = North.new
  SOUTH = South.new
  EAST = East.new
  WEST = West.new

  DIRECTIONS = {
    'N' => NORTH,
    'E' => EAST,
    'W' => WEST,
    'S' => SOUTH
  }.freeze

  def self.get_direction_by_name(direction)
    DIRECTIONS[direction]
  end
end
