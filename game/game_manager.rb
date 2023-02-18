require_relative 'game'
require_relative 'author'
require_relative '../file_manager'

class GameManager
  def initialize
    @file_manager = FileManager.new
    @games = []
    @authors = []
    load_data
  end

  def load_data
    @games.concat @file_manager.load_games('games')
    @authors.concat @file_manager.load_authors('authors', @games)
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

  def list_games
    @games.each_with_index do |game, index|
      next unless game.instance_of? Game

      puts "#{index}) Game: #{game.name}, published at: #{game.publish_date}, last played at: #{game.last_played_at}"
    end
  end

  def list_authors
    @authors.each_with_index do |author, idx|
      puts "#{idx}) Author name: #{author.first_name} #{author.last_name}"
    end
  end

  def save_data
    @file_manager.save_records('games', @games)
    @file_manager.save_records('authors', @authors)
  end
end
