require_relative 'file_manager'
require_relative 'user_entry'
require_relative 'book'
require_relative 'label'

class BookManager
  def initialize
    @file_manager = FileManager.new
    @labels = []
    @books = []
    load_data
  end

  def load_data
    @books.concat @file_manager.load_books 'books'
    @labels.concat @file_manager.load_labels('labels', @books)
  end

  def add_book
    title = UserEntry.get_str('Book title: ', 'Please enter a valid title!')
    publish_date = UserEntry.get_date('Publish date: ', 'Please enter a valid date!')
    publisher = UserEntry.get_str('Publisher: ', 'Please enter a valid name!')
    cover_state = UserEntry.get_str('Cover state: ', 'Please enter a valid cover state!')
    @books << Book.new(title, publish_date, publisher, cover_state)
    puts 'Book created successfully'
  end

  def list_labels
    @labels.each_with_index do |label, idx|
      puts "#{idx}) Title: #{label.title}, Color: #{label.color}"
    end
  end

  # rubocop:disable Layout/LineLength
  def list_books
    @books.each_with_index do |item, idx|
      next unless item.instance_of? Book

      puts "#{idx}) #{item.title} by #{item.publisher}, published at #{item.publish_date} with #{item.cover_state} cover state."
    end
  end
  # rubocop:enable Layout/LineLength

  def save_data
    @file_manager.save_records('books', Book.to_s, @books)
    @file_manager.save_records('labels', Label.to_s, @labels)
  end
end
