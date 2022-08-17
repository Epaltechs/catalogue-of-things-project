class Author
  attr_accessor :id, :first_name, :last_name, :items

  def initialize(first_name = 'unknown', last_name = 'unknown')
    @first_name = first_name
    @last_name = last_name
    @id = rand(1...1000)
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_author(self) unless item.authors.include?(self)
  end
end
