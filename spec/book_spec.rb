require './book'

require 'date'

describe Book do
  before :each do
   @book = Book.new('Artur', 'bad', '12-12-1999')
  end
  it 'returns a new item object' do
    @book.should be_an_instance_of Book
  end

  it 'should return bad' do
    expect(@book.cover_state).to eq('bad')
  end

  it 'should return false' do
    expect(@book.archived).to be(false)
  end
end
