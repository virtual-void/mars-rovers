module MarsRovers
  class Error < StandardError
  end

  class CommandNotSupportedError < Error
  end

  class OutOfPlanetError < Error
  end
end
