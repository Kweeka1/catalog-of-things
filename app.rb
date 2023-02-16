require_relative 'book'
require_relative 'user_entry'
require_relative 'file_manager'
require_relative './music/music_album'
require_relative './game'
require_relative './author'

class App
  def initialize
    @file_manager = FileManager.new
    @labels = []
    @items = []
    @games = []
    @authors = []
    load_data
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength
  def run
    puts 'Welcome to Catalog of my things'
    music = MusicAlbum.new
    music.load_music
    music.load_genre

    loop do
      print_option
      option = gets.chomp

      case option
      when '1'
        list_books
      when '2'
        music.list_music
      when '5'
        music.list_genre
      when '4'
        list_games
      when '6'
        list_labels
      when '7'
        list_authors
      when '9'
        add_book
      when '10'
        music.add_music
      when '12'
        add_game
      when '13'
        save_data
        music.save_music
        break
      else
        puts 'list other things'
      end
    end
  end

  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength

  private

  def load_data
    @items.concat @file_manager.load_books 'books'
    @labels.concat @file_manager.load_labels('labels', @items)
    @games.concat @file_manager.load_games('games')
    @authors.concat @file_manager.load_authors('authors', @items)
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

  def add_game
    name = UserEntry.get_str('Enter game name: ', 'Please enter a valid game name')

    publish_date = UserEntry.get_date('Publish date: ', 'Please enter a valid date!')

    last_played_at = UserEntry.get_date('last played at date: ', 'Please enter a valid date!')

    multiplayer =
      UserEntry.get_bool(
        'Multiplayer(y/n): ',
        'Value entered is not valid. Please enter (y) for yes and (n) for no'
      )
    @games << Game.new(name, publish_date, last_played_at, multiplayer)
    puts 'Game created successfully'
  end

  def list_labels
    @labels.each_with_index do |label, idx|
      puts "#{idx}) Title: #{label.title}, Color: #{label.color}"
    end
  end

  # rubocop:disable Layout/LineLength
  def list_books
    idx = 0
    @items.each do |item|
      next unless item.instance_of? Book

      puts "#{idx}) #{item.title} by #{item.publisher}, published at #{item.publish_date} with #{item.cover_state} cover state."
      idx += 1
    end
  end
  # rubocop:enable Layout/LineLength

  def list_games
    index = 0

    @games.each do |game|
      next unless game.instance_of? Game

      puts "#{index}) Game: #{game.name}, published at: #{game.publish_date}, last played at: #{game.last_played_at}"
      index += 1
    end
  end

  def list_authors
    @authors.each_with_index do |author, idx|
      puts "#{idx}) Author name: #{author.first_name} #{author.last_name}"
    end
  end

  def save_data
    @file_manager.save_records('books', Book.to_s, @items)
    @file_manager.save_records('labels', Label.to_s, @labels)
    @file_manager.save_records('games', Game.to_s, @games)
    @file_manager.save_records('authors', Author.to_s, @authors)
  end
end
