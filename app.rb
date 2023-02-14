require_relative './music/music_album'

class App
  def run
    music = MusicAlbum.new
    music.load_music
    music.load_genre
  
    loop do
      print_option
      option = gets.chomp

      case option
      when '2'
        music.list_music
      when '5'
        music.list_genre
      when '10'
        music.add_music
      when '13'
        music.save_music
        break

      else
        puts 'list other things'
      end
    end
  end

  private

  def print_option
    puts "
Please select an option by specifying a number
1 - List all books
2 - List all music albums
3 - List all movies
4 - List of games
5 - List all genres (e.g 'Comedy', 'Thriller')
6 - List all labels (e.g. 'Gift', 'New')
7 - List all authors (e.g. 'Stephen King')
8 - List all sources (e.g. 'From a friend', 'Online shop')
9 - Add a book
10 - Add a music album
11 - Add a movie
12 - Add a game
13 - Quit
"
  end
end
