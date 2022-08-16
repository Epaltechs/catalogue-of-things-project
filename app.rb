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
    until option
      input = gets.chomp
      if input == '10'
        puts 'Thank you! :)'
        break
      end
      option(input)
    end
  end
end
