require 'spec_helper'

describe 'command_center methods' do
  before(:each) do
    @planet = Planet.new(5, 5)
  end

  context "planet with dimension (5,5) and position (1,2) and direction ('N')" do
    it "returns north ('N') direction and position (1,3) after it sends commands ('LMLMLMLMM')" do
      @planet = Planet.new(5, 5)
      position = Compass::Position.new(1, 2)
      direction = Compass::NORTH
      rover = Rover.new.drop_on_planet(@planet, position, direction)

      CommandCenter.send('LMLMLMLMM', rover)

      expect(rover.position.x).to eq(1)
      expect(rover.position.y).to eq(3)
      expect(rover.direction).to eq(Compass::NORTH)
    end
  end

  context "planet with dimension (5,5) and position (3,3) and direction ('E')" do
    it "returns east ('E') direction and position (5,1) after it sends commands ('MMRMMRMRRM')" do
      position = Compass::Position.new(3, 3)
      direction = Compass::EAST
      rover = Rover.new.drop_on_planet(@planet, position, direction)

      CommandCenter.send('MMRMMRMRRM', rover)

      expect(rover.position.x).to eq(5)
      expect(rover.position.y).to eq(1)
      expect(rover.direction).to eq(Compass::EAST)
    end
  end
end
