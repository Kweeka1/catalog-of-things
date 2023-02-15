require_relative 'book'
require_relative 'label'

class FileManager
  def initialize(path = './data')
    @path = path
    create_dir_unless_exists(path)
  end

  def save_records(file_name, type, records)
    serialized = []
    records.each do |item|
      next unless item.class.to_s == type

      serialized << item.to_object
    end
    File.write("#{@path}/#{file_name}.json", JSON.dump(serialized))
  end

  def load_books(file_name)
    records = JSON.load_file "#{@path}/#{file_name}.json"
    records.map do |record|
      Book.new(record['title'], record['publish_date'], record['publisher'], record['cover_state'], record['id'])
    end
  rescue StandardError
    []
  end

  # @param [String] file_name
  # @param [Array] items
  def load_labels(file_name, items)
    records = JSON.load_file "#{@path}/#{file_name}.json"
    labels = []
    records.each do |record|
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

  private

  def create_dir_unless_exists(path)
    Dir.mkdir 'data' unless Dir.exist? path
  end
end
