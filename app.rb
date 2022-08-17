require './game'
class App
  def initialize
    @genres = []
    @albums = []
    @all_books = []
    @all_labels = []
    @games = []
    @authors = []
  end

  def create_game
    print 'Do you want a multiplayer game? (y/n): '
    multiplayer = gets.chomp.downcase == 'n' ? 'no' : 'yes'
    print 'Enter published date (YYYY-MM-DD): '
    published_date = gets.chomp
    print 'Enter last played date (YYYY-MM-DD): '
    last_played_at = gets.chomp
    print 'Enter first name: '
    first_name = gets.chomp
    print 'Enter last name: '
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    game = Game.new(multiplayer, last_played_at, published_date)
    @games << game
    @authors << author
    author.add_items(game)
    save_gane(game)
    puts 'Game has been added to the catalog.'
  end

  def list_games
    if @games.empty?
      puts 'Hey..there is no game in store! Please choose (12) to add a game.'
    else
      @games.each do |game|
        puts "MULTIPLAYER: #{game.multiplayer}"
        puts "DATE OF LAST PLAY: #{game.last_played_at}"
        puts "PUBLISHED DATE: #{game.publish_date}"
        puts "FIRST NAME OF AUTHOR => #{game.author.first_name}"
        puts "LAST NAME OF AUTHOR => #{game.author.last_name}\n"
        puts
      end
    end
  end

  def list_authors
    if @authors.empty?
      puts 'Hey...there is no author! Please choose (13) to add an author.'
    else
      @authors.each do |author|
        puts "ID: #{author.id}", "First name: #{author.first_name}, Last name: #{author.last_name}"
      end
    end
  end
end
