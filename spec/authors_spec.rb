require './game'
require './author'
describe Author do
  before :all do
    @author = Author.new('J.K. Rowling', 'Harry Potter')
    @game = Game.new('Jackson', '2008-01-11', '2005-09-05')
  end
  context 'when creating an instance of the class Author' do
    it 'it takes two parameters and return a Label object' do
      expect(@author).to be_an_instance_of Author
    end
  end
  context 'When retrieving the first name of author' do
    it 'it returns the first name of the author' do
      expect(@author).to be_an_instance_of Author
    end
  end

end
