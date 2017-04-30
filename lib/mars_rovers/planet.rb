class Planet

  def initialize(height, width)
    @height = height
    @width = width
    @rovers = []
  end

  def update(rover)
    raise OutOfPlanetError unless on_planet_bounds?(rover)

    @rovers << rover unless dropped?(rover)
  end

  def dropped?(rover)
    @rovers.detect { |x| x.equal?(rover) }
  end

  def on_planet_bounds?(rover)
    rover.position.x >= 0 and rover.position.x <= @width and
        rover.position.y >= 0 and rover.position.y <= @height
  end

end
