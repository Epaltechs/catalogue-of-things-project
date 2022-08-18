class Item
  attr_accessor :label, :id, :publish_date

  def initialize(genre, author, source, label, publish_date = Time.now.year)
    @id = rand(1..1000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def add_auther(author)
    author.add_item(self) unless author.items.include?(self)
  end

  def add_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    Time.now.year - @publish_date.year > 10
  end
end
