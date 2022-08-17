require_relative 'book'
require_relative 'label'

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

    print 'Publish date (DD-MM-YEAR): '
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
end
