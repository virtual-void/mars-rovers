require 'spec_helper'

describe 'rover' do
  context 'initialize' do
    it 'inits' do
      rover = Rover.new
    end
  end
end

describe 'rover methods' do
  before(:each) do
    @planet = Planet.new(5, 5)
    @position = Compass::Position.new(1, 2)
    @direction = Compass::NORTH
    @rover = Rover.new
  end

  context 'planet and position and direction' do
    it 'drops on planet' do
      @rover.drop_on_planet(@planet, @position, @direction)
      expect(@rover.position).to eq(@position)
      expect(@rover.direction).to eq(@direction)
    end

    it 'returns proper direction after it turns' do
      @rover.drop_on_planet(@planet, @position, @direction)
      'LRRLRLRLLLR'.each_char { |command| @rover.receive_command(command) }

      expect(@rover.direction).to eq(Compass::WEST)
    end

    it 'returns proper direction after it moves to north' do
      @rover.drop_on_planet(@planet, @position, Compass::NORTH).receive_command('M')
      expect(@rover.position.x).to eq(1)
      expect(@rover.position.y).to eq(3)
      expect(@rover.direction).to eq(Compass::NORTH)
    end

    it 'returns proper direction after it moves to south' do
      @rover.drop_on_planet(@planet, @position, Compass::SOUTH).receive_command('M')
      expect(@rover.position.x).to eq(1)
      expect(@rover.position.y).to eq(1)
      expect(@rover.direction).to eq(Compass::SOUTH)
    end

    it 'returns proper direction after it moves to west' do
      @rover.drop_on_planet(@planet, @position, Compass::WEST).receive_command('M')
      expect(@rover.position.x).to eq(0)
      expect(@rover.position.y).to eq(2)
      expect(@rover.direction).to eq(Compass::WEST)
    end

    it 'returns proper direction after it moves to east' do
      @rover.drop_on_planet(@planet, @position, Compass::EAST).receive_command('M')
      expect(@rover.position.x).to eq(2)
      expect(@rover.position.y).to eq(2)
      expect(@rover.direction).to eq(Compass::EAST)
    end

    it 'raises error when rover drops out from planet bounds' do
      @planet = Planet.new(2, 2)
      @position = Compass::Position.new(2, 2)

      begin
        @rover.drop_on_planet(@planet, @position, Compass::NORTH)
      rescue StandardError => err
        expect(err).to be_a_kind_of(OutOfPlanetError)
      end
    end

    it 'raises error when rover moves out from planet bounds' do
      @planet = Planet.new(2, 2)
      @position = Compass::Position.new(1, 2)

      begin
        @rover.drop_on_planet(@planet, @position, Compass::NORTH).receive_command('M')
      rescue StandardError => err
        expect(err).to be_a_kind_of(OutOfPlanetError)
      end
    end

    it 'returns string' do
      @rover.drop_on_planet(@planet, @position, @direction)
      expect(@rover.position).to eq(@position)
      expect(@rover.direction).to eq(@direction)
      expect(@rover.to_s).to eq('1 2 N')
    end
  end
end
