require_relative './item'

class Game < item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived
    current_year = Time.new.current_year
    last_update = current_year - @last_played_at
    super && last_update > 2
  end
end
