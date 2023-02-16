require_relative 'book/book'
require_relative 'user_entry'
require_relative 'file_manager'
require_relative './music/music_album'
require_relative './game/game_manager'
require_relative './book/book_manager'

class App
  def initialize
    @book_manager = BookManager.new
    @game_manager = GameManager.new
    @music = MusicAlbum.new
    @music.load_music
    @music.load_genre
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength
  def run
    puts 'Welcome to Catalog of my things'
    loop do
      print_option
      option = gets.chomp

      case option
      when '1'
        @book_manager.list_books
      when '2'
        @music.list_music
      when '3'
        @game_manager.list_games
      when '4'
        @music.list_genre
      when '5'
        @book_manager.list_labels
      when '6'
        @game_manager.list_authors
      when '7'
        @book_manager.add_book
      when '8'
        @music.add_music
      when '9'
        @game_manager.add_game
      when '10'
        @book_manager.save_data
        @game_manager.save_data
        @music.save_music
        return
      else
        puts ''
      end
    end
  end

  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength

  private

  def print_option
    puts "
Please select an option by specifying the corresponding number:
1  -  List all books
2  -  List all music albums
3  -  List of games
4  -  List all genres (e.g 'Comedy', 'Thriller')
5  -  List all labels (e.g. 'Gift', 'New')
6  -  List all authors (e.g. 'Stephen King')
7  -  Add a book
8  -  Add a music album
9  -  Add a game
10 -  Quit"
  end
end
