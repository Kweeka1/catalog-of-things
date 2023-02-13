require './music'
require './genre'
require 'json'

class MusicAlbum
  def initialize
    @music = []
    @genres = []
  end

  def list_music
    if @music.empty?
      puts "There is no music"
    else
      @music.each { |song| puts "id : #{song.id}, on_spotify: #{song.on_spotify}, publish_date :#{song.publish_date}"}
    end
  end

  def list_genre
    if @genres.empty?
      puts "There is no genre"
    else
      @genres.each { |genre| puts "id : #{genre.id}, name: #{genre.name}"}
    end
  end

  def add_genre
    print "Add genre (Comedy, Horror) : "
    name = gets.chomp
    @genres << Genre.new(name)
    puts "Added Genre"
  end


  def add_music
    print "publish_date :"
    publish_date = gets.chomp
    print "on_spotify (true,false) :"
    on_spotify = gets.chomp
    if on_spotify == 'true'
      spotify = true 
    else
      spotify = false
    end
    @music << Music.new(publish_date, spotify)
    puts "Added Music"
  end

  def save_music
    music = @music.map { |song| { id:song.id, on_spotify: song.on_spotify, publish_date: song.publish_date } }.to_json
    genre = @genres.map { |genre| { id: genre.id, name: genre.name } }.to_json
    save_m = File.open("music.json","w")
    save_g = File.open("genre.json","w")
    save_m.write(music)
    save_g.write(genre)
  end

  def load_music 
    if File.exist?('music.json')
      load_music = File.read('music.json')
      json_music = JSON.parse(load_music)
    else
      File.write('music.json', [])
      json_music = []
    end

    return if json_music.empty?

    new_music = json_music.map { |music| Music.new(music['publish_date'], music['on_spotify']) }
    new_music.map { |song| @music << song }
  end

  def load_genre 
    if File.exist?('genre.json')
      load_genre = File.read('genre.json')
      json_genre = JSON.parse(load_genre)
    else
      File.write('genre.json', [])
      json_genre = []
    end

    return if json_genre.empty?

    new_genre = json_genre.map { |genre| Genre.new(genre['name']) }
    new_genre.map { |g| @genres << g }
  end

end