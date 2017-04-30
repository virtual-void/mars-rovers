require 'spec_helper'

describe 'control api unit' do
  context 'initialize' do
    it 'inits' do
      api = ControlApi.new(Rover.new)
    end
  end
end

describe 'control api methods' do
  before(:each) do
    @rover = Rover.new
    @api = ControlApi.new(@rover)
  end

  context 'rover' do
    it "turns to west by valid command ('L')" do
      @api.interpret('L')
      expect(@rover.position.x).to eq(0)
      expect(@rover.position.y).to eq(0)
      expect(@rover.direction).to eq(Compass::WEST)
    end

    it "raises error when interprets invalid command ('T')" do
      begin
        @api.interpret('T')
      rescue StandardError => err
        expect(err).to be_a_kind_of(CommandNotSupportedError)
      end
    end
  end
end
