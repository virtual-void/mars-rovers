require 'spec_helper'

module MarsRovers
  describe 'position x and y' do
    context 'initialize x and y' do
      it 'sets x and y' do
        position = Compass::Position.new(1, 2)
        expect(position.x).to eq(1)
        expect(position.y).to eq(2)
      end
    end
  end

  describe 'position methods' do
    before(:each) do
      @position = Compass::Position.new(1, 2)
    end

    context 'x and y' do
      it 'adds' do
        expect(@position.x).to eq(1)
        expect(@position.y).to eq(2)
        @position.add(Compass::Position.new(2, 2))
        expect(@position.x).to eq(3)
        expect(@position.y).to eq(4)
      end

      it 'returns string' do
        expect(@position.to_s).to eq('1 2')
      end
    end
  end
end
