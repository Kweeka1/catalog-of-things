require_relative 'book/book'
require_relative 'book/label'
require_relative 'game/game'

class FileManager
  def initialize(path = './data')
    @path = path
    create_dir_unless_exists(path)
  end

  def save_records(file_name, records)
    serialized = []
    records.each do |item|
      serialized << item.to_object
    end
    File.write("#{@path}/#{file_name}.json", JSON.dump(serialized))
  end

  def load_books(file_name)
    records = JSON.load_file "#{@path}/#{file_name}.json"
    records.map do |record|
      Book.new(
        record['title'],
        record['publish_date'],
        record['publisher'],
        record['cover_state'],
        record['id']
      )
    end
  rescue StandardError
    []
  end

  # @param [String] file_name
  # @param [Array] items
  def load_labels(file_name, items)
    records = JSON.load_file "#{@path}/#{file_name}.json"
    labels = []
    records.map do |record|
      label = Label.new(record['title'], record['color'], [], record['id'])
      labels << label
      next if record['items'].empty?

      record['items'].each do |item_id|
        item = items.find { |elem| elem.id == item_id }
        label.add_item(item) unless item.nil?
      end
    end
    labels
  rescue StandardError
    []
  end

  def load_authors(file_name, items)
    records = JSON.load_file "#{@path}/#{file_name}.json"
    authors = []
    records.map do |record|
      author = Author.new(record['first_name'], record['last_name'])
      authors << author
      next if record['items'].empty?

      record['items'].each do |item_id|
        item = items.find { |elem| elem.id == item_id }
        author.add_item(item) unless item.nil?
      end
    end
    authors
  end

  def load_games(file_name)
    records = JSON.load_file "#{@path}/#{file_name}.json"

    records.map do |record|
      Game.new(
        record['name'],
        record['publish_date'],
        record['last_played_at'],
        record['multiplayer']
      )
    rescue StandardError
      []
    end
  end

  private

  def create_dir_unless_exists(path)
    Dir.mkdir 'data' unless Dir.exist? path
  end
end
