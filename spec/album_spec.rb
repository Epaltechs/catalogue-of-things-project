require './music_album'
require 'date'

describe MusicAlbum do
  it 'has a name' do
    date = Date.parse('15-03-1995')
    album = MusicAlbum.new(date, 'My Sunshine', 'y')
    expect(album.name).to eq('My Sunshine')
  end
  it 'returns the correct year' do
    date = Date.parse('15-03-1995')
    album = MusicAlbum.new(date, 'My Sunshine', 'y')
    expect(album.publish_date.year).to eq(1995)
  end
end
