require './game'
require './author'
describe Game do
  before :each do
    @game = Game.new('Jackson', Date.parse('2008-01-11'), Date.parse('2005-09-05'))
  end
  context 'when creating an instance of the class Game' do
    it 'it takes three parameters and return a Game object' do
      expect(@game).to be_an_instance_of Game
    end
  end
end
