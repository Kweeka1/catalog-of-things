class Label
  attr_reader :title, :color, :items

  # @param [String] title
  # @param [String] color
  # @param [Array] items
  # @param [Integer] id
  def initialize(title, color, items = [], id = Random.rand(0..10_000))
    @id = id
    @items = items
    @title = title
    @color = color
  end

  # @param [Item] item
  def add_item(item)
    @items << item unless @items.include? item
    item.label = self
  end

  # @return [Hash]
  def to_object
    {
      'id' => @id,
      'title' => @title,
      'color' => @color,
      'items' => @items.map(&:id)
    }
  end
end
