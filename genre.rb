require './music_album'

class Genre
  attr_reader :items, :name, :id

  def initialize(name, id: rand(1..1000))
    @id = id
  attr_accessor :items, :name

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genres = self
    @items.push(item)
    item.genre = self
  end
end
