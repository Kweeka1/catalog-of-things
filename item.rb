require 'date'
require 'time'

class Item
  attr_reader :publish_date, :id
  attr_accessor :label

  # @param [Date] publish_date
  # @param [Integer] id
  # @param [Boolean] archived
  def initialize(publish_date, id = Random.rand(0..10_000), archived: false)
    @publish_date = publish_date
    @archived = archived
    @id = id
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  # @param [Label] label
  def add_label(label)
    self.label = label
    label.add_item self unless label.items.include? self
  end

  private

  # @return [Boolean]
  def can_be_archived?
    Time.now.year - @publish_date.year > 10
  end
end
