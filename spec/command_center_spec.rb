require 'spec_helper'

module MarsRovers
  describe 'command_center methods' do
    before(:each) do
      @planet = Planet.new(5, 5)
    end

    context "planet with dimension (5,5) and position (1,2) and direction ('N')" do
      it "returns north ('N') direction and position (1,3) after it receives commands ('LMLMLMLMM')" do
        @planet = Planet.new(5, 5)
        rover = Rover.new.drop_on_planet(@planet, 1, 2, 'N')

        CommandCenter.receive_commands('LMLMLMLMM', rover)

        expect(rover.position.x).to eq(1)
        expect(rover.position.y).to eq(3)
        expect(rover.direction).to eq(Compass::NORTH)
      end
    end

    context "planet with dimension (5,5) and position (3,3) and direction ('E')" do
      it "returns east ('E') direction and position (5,1) after it receives commands ('MMRMMRMRRM')" do
        rover = Rover.new.drop_on_planet(@planet, 3, 3, 'E')

        CommandCenter.receive_commands('MMRMMRMRRM', rover)

        expect(rover.position.x).to eq(5)
        expect(rover.position.y).to eq(1)
        expect(rover.direction).to eq(Compass::EAST)
      end
    end
  end
end
