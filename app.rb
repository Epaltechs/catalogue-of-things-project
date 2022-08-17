require_relative 'book'
require_relative 'label'
require_relative 'data/data_book'
require_relative 'music_album'
require_relative 'genre'
require 'date'

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
    load_preserve_data
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
      puts "Label: \'#{book.label.title}\', \'#{book.label.color}\'"
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

    @all_labels.each { |label| puts "Id: \'#{label.id}\', Title: \'#{label.title}\', Color: \'#{label.color}\'" }
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

  def load_preserve_data
    load_books_and_labels @all_books, @all_labels
  end
end
