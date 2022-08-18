require './music_album'
require './book'
require './label'
require './genre'
require './author'
require './game'
require './store_game'
# require_relative 'data/store_game'

class App
  def initialize
    @genres = []
    @albums = []
    @all_books = []
    @all_labels = []
    @games = []
    @authors = []
  end

  def run
    puts
    puts
    until display_list
      input = gets.chomp
      if input == '10'
        puts 'Thank you! :)'
        break
      end
      option(input)
    end
  end

  def create_book
    print 'Publisher: '
    book_publisher = gets.chomp

    print 'Cover State: '
    book_cover_state = gets.chomp

    print 'Label title: '
    book_label_title = gets.chomp

    print 'Label color: '
    book_label_color = gets.chomp

    print 'Publish date (DD-MM-YYYY): '
    book_publish_date = gets.chomp

    puts

    label = Label.new book_label_title, book_label_color

    mybook = Book.new book_publisher, book_cover_state, book_publish_date

    @all_books << mybook
    @all_labels << Label

    label.add_item(mybook)

    save_book(book_publisher, book_cover_state, book_label_title, book_label_color, book_publish_date)

    puts 'Book created successfully.'
    puts
    sleep 0.75
  end

  def list_books
    puts
    puts 'There are no books to show! Please add a book.' if @all_books.empty?

    @all_books.each do |book|
      puts '--------------------'
      puts "ID: #{book.id}"
      puts "Publisher: #{book.publisher}"
      puts "Cover State: #{book.cover_state}"
      puts "Label: \'#{book.title}\', \'#{book.label.color}\'"
      puts "Publish date: #{book.publish_date}"
      puts '--------------------'
      puts
    end
    puts
    puts
    sleep 0.75
  end

  def list_labels
    puts
    puts 'There are no labels to show! Please add a label.' if @all_labels.empty?

    @all_labels.each { |label| puts "ID: \'#{label.id}\', Title: \'#{label.title}\', Color: \'#{label.color}\'" }
    puts
    puts
    sleep 0.75
  end

  def create_album
    puts 'Name: '
    name = gets.chomp

    puts 'Publish Date (DD-MM-YYYY): '
    date = Date.parse(gets.chomp)

    puts 'Genre: '
    genre_name = gets.chomp

    puts 'On Spotify (y/n): '
    on_spotify = gets.chomp

    album = MusicAlbum.new(date, name, on_spotify)
    genre = Genre.new(genre_name)

    @albums << album
    @genres << genre

    genre.add_item(album)

    # save_album(date, name, genre_name, on_spotify)

    puts "#{name} It has been added to the list. ✅"
  end

  def list_genres
    puts
    puts 'No genre functionality! You can create one by adding a genre.' if @genres.empty?

    @genres.each_with_index { |genre, index| puts "#{index}: Name: #{genre.name}" }
    puts
    puts
  end

  def list_albums
    puts
    puts 'There are no albums yet. Select (8) to create one.' if @albums.empty?

    @albums.each do |album|
      puts "ID: #{album.id}: Name: #{album.name} Genre: #{album.genre.name} On_Spotify: #{album.on_spotify}"
      puts
    end
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
    author.add_item(game)
    save_file(game)
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
