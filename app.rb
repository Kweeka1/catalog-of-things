require_relative 'book'
require_relative 'user_entry'
require_relative 'file_manager'

class App
  def initialize
    @file_manager = FileManager.new
    @labels = []
    @items = []
    load_data
  end

  def run
    puts 'Welcome to Catalog of my things'
    loop do
      print_option
      option = gets.chomp

      case option
      when '1'
        list_books
      when '6'
        list_labels
      when '9'
        add_book
      when '13'
        save_data
        return
      end
    end
  end

  private

  def load_data
    @items.concat @file_manager.load_books 'books'
    @labels.concat @file_manager.load_labels('labels', @items)
  end

  def print_option
    puts "
Please select an option by specifying the corresponding number:
1  -  List all books
2  -  List all music albums
3  -  List all movies
4  -  List of games
5  -  List all genres (e.g 'Comedy', 'Thriller')
6  -  List all labels (e.g. 'Gift', 'New')
7  -  List all authors (e.g. 'Stephen King')
8  -  List all sources (e.g. 'From a friend', 'Online shop')
9  -  Add a book
10 -  Add a music album
11 -  Add a movie
12 -  Add a game
13 -  Quit"
  end

  def add_book
    title = UserEntry.get_str('Book title: ', 'Please enter a valid title!')
    publish_date = UserEntry.get_date('Publish date: ', 'Please enter a valid date!')
    publisher = UserEntry.get_str('Publisher: ', 'Please enter a valid name!')
    cover_state = UserEntry.get_str('Cover state: ', 'Please enter a valid cover state!')
    @items << Book.new(title, publish_date, publisher, cover_state)
    puts 'Book created successfully'
  end

  def list_labels
    @labels.each_with_index do |label, idx|
      puts "#{idx}) #{label.title}, #{label.color}"
    end
  end

  # rubocop:disable Layout/LineLength
  def list_books
    @items.each_with_index do |item, idx|
      next unless item.instance_of? Book

      puts "#{idx}) #{item.title} by #{item.publisher}, published at #{item.publish_date} with #{item.cover_state} cover state."
    end
  end

  def save_data
    @file_manager.save_records('books', Book.to_s, @items)
    @file_manager.save_records('labels', Label.to_s, @labels)
  end
end
