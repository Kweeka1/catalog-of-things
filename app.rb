class App
  def run
    print_option
    loop do
      option = gets.chomp

      case option
      when '1'
        puts 'list books'
      else
        puts 'list other things'
      end
      puts 'not implemented'
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
